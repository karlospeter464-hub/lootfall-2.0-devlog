extends SceneTree

# Capture-only controller, copied into a pinned source snapshot; never an autoload.
var shot: String = "A"
var source_commit: String = ""
var output_prefix: String = ""
var duration: float = 8
var game
var frame: int = 0
var started: bool = false
var max_enemies: int = 0
var observed_hits: int = 0
var observed_kills: int = 0
var checks: Array[String] = []
var initial_points: Array = []

func _initialize() -> void:
	if not OS.get_cmdline_user_args().has("--test-mode"):
		push_error("Capture requires isolated --test-mode")
		quit(1)
		return
	for arg in OS.get_cmdline_user_args():
		if arg.begins_with("--shot="): shot = arg.trim_prefix("--shot=")
		if arg.begins_with("--commit="): source_commit = arg.trim_prefix("--commit=")
		if arg.begins_with("--output-prefix="): output_prefix = arg.trim_prefix("--output-prefix=")
		if arg.begins_with("--seconds="): duration = arg.trim_prefix("--seconds=").to_float()
	if shot not in ["A", "B", "C", "D", "E", "F"] or output_prefix.is_empty() or duration < 3:
		quit(1)
		return
	root.content_scale_size = Vector2i(1280, 720)
	root.content_scale_mode = Window.CONTENT_SCALE_MODE_CANVAS_ITEMS
	root.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_KEEP
	call_deferred("setup")

func setup() -> void:
	game = load("res://scenes/arena.tscn").instantiate()
	root.add_child(game)
	# Fit the original 16:10 canvas inside 16:9 without Movie Maker's center crop.
	var fit := Transform2D(Vector2(0.9, 0), Vector2(0, 0.9), Vector2(64, 0))
	root.canvas_transform = fit
	RenderingServer.set_default_clear_color(Color("0d141d"))
	for child in game.get_children():
		if child is CanvasLayer: child.transform = fit
	await process_frame
	game.restart_run()
	game.set_process(false)
	game.player.controls_enabled = false
	game.player.invulnerable = true
	game.rng.seed = 4201
	game.player.position = Vector2(640, 430)
	if shot in ["A", "B"]:
		assert(not game.has_method("restore_completed_waves"), "Historical shots require the actual pre-Restoration source")
	else:
		var world: Dictionary = game.WORLD.fresh()
		if shot == "E": world.points[0] = 288
		if shot == "F":
			world.points = [600, 560, 0]
			world.best = [12, 7, 0]
		game.progress._save(180 if shot == "F" else 0, 12 if shot == "F" else 0, {}, world)
		game.run_region = 0
		game.restoration_visual = game.WORLD.fraction(world, 0)
		initial_points = world.points.duplicate()
	if shot == "F":
		game._show_town()
	else:
		game.wave = 1 if shot == "B" else (11 if shot in ["D", "E"] else 2)
		game.begin_wave()
		if shot in ["A", "B", "C"]:
			game.wave_budget = 40
			game.remaining_to_spawn = 40
		game.player.controls_enabled = false
		game.spawn_clock = 9999
		game.equipment.scepter = "swift_scepter" if shot == "A" else "ember_scepter"
		game.equipment.book = "storm_grimoire" if shot == "B" else "cinder_codex"
		game.fan_upgrades = 1
		game.power_upgrades = 1
		if shot == "B": game.mechanic_cards.append(3)
		game.update_build()
		var count: int = 10 if shot in ["A", "B"] else 7
		for index in count:
			game.spawn_enemy("seer" if index == count - 1 and shot != "B" else "chaser")
			var enemy = game.enemies.get_child(index)
			var angle: float = index * TAU / count
			enemy.position = Vector2(640, 430) + Vector2(cos(angle) * 230, sin(angle) * 190)
	game.update_hud()
	started = true

func _process(delta: float) -> bool:
	if not started: return false
	frame += 1
	var t: float = float(frame) / 30
	if shot == "F":
		if frame == 150: game.town_panel.show_tree()
		if frame == 210: game.town_panel.show_city()
	else:
		if not paused:
			game.player.position = Vector2(640 + sin(t * 1.1) * 65, 430 + sin(t * 0.8) * 35)
			var target = null
			for enemy in game.enemies.get_children():
				if not enemy.dead and (target == null or enemy.position.distance_squared_to(game.player.position) < target.position.distance_squared_to(game.player.position)):
					target = enemy
			if target != null:
				game.player.aim = game.player.position.direction_to(target.position)
				game.player.attack(game.player.aim)
			game._process(delta)
			if shot in ["A", "B", "C"] and frame % 12 == 0 and game.enemies.get_child_count() < 7 and game.remaining_to_spawn > 0 and not (shot == "B" and frame >= 135):
				game.spawn_enemy("chaser")
				var last = game.enemies.get_child(game.enemies.get_child_count() - 1)
				last.position = Vector2(640, 430) + Vector2.from_angle(frame * 0.37) * 220
		max_enemies = maxi(max_enemies, game.enemies.get_child_count())
		observed_hits = maxi(observed_hits, game.shots_hit)
		observed_kills = maxi(observed_kills, game.kills)
		if (shot == "B" and frame == 135) or (shot in ["D", "E"] and frame == 60):
			game.remaining_to_spawn = 0
			for enemy in game.enemies.get_children(): enemy.take_damage(1000000)
		if shot in ["D", "E"] and frame == 62:
			game.complete_wave()
			game.effects.clear()
			for projectile in game.projectiles.get_children(): projectile.queue_free()
		if shot == "D" and frame >= 62: game.overlay.hide()
		if shot == "E" and frame == 150 and game.state == game.State.UPGRADE:
			game.buttons.get_child(0).pressed.emit()
		if shot == "E" and frame == 180:
			game.finish_run(false)
			game.return_to_town()
	if frame in [30, 90, 150, 210]: save_preview(frame)
	if frame >= int(duration * 30): finish()
	return false

func save_preview(number: int) -> void:
	await RenderingServer.frame_post_draw
	var error: Error = root.get_texture().get_image().save_png(output_prefix + "_%03d.png" % number)
	assert(error == OK, "Preview write failed")

func finish() -> void:
	started = false
	var valid: bool = true
	if shot != "F":
		valid = observed_hits > 0 and max_enemies >= 5
		checks.append("Real projectiles hit real enemies; multiple actors visible")
	if shot == "B":
		valid = valid and game.state == game.State.UPGRADE and game.buttons.get_child_count() == 3
		checks.append("Real wave-clear path opened three upgrade choices")
	if shot == "C":
		valid = valid and game.progress.world.points == [0, 0, 0]
		checks.append("Ashen Fields remained fully blighted")
	if shot == "D":
		valid = valid and game.progress.world.points == [312, 0, 0]
		checks.append("Actual cumulative wave credit grew Fields from 0 to 52 percent")
	if shot == "E":
		valid = valid and game.progress.world.points == [600, 0, 0] and game.state == game.State.TOWN
		checks.append("Actual completion unlocked Grove and returned to town")
	var data := {"shot": shot, "source_commit": source_commit, "game_version": ProjectSettings.get_setting("application/config/version", ""), "capture_kind": "controlled historical reconstruction" if shot in ["A", "B"] else "controlled current-source runtime", "fps": 30, "frames": frame, "requested_seconds": duration, "viewport": [root.size.x, root.size.y], "seed": 4201, "invulnerable": true, "scripted_centered_movement": true, "initial_world_points": initial_points, "shots_hit": observed_hits, "kills": observed_kills, "max_enemies": max_enemies, "checks": checks, "passed": valid}
	var file := FileAccess.open(output_prefix + ".json", FileAccess.WRITE)
	file.store_string(JSON.stringify(data, "\t"))
	file.close()
	print("EP01 CAPTURE: ", JSON.stringify(data))
	quit(0 if valid else 1)
