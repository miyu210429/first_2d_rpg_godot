extends CharacterBody2D

var speed = 45
var player_chase = false
var player = null

#敵の物理
func _physics_process(delta):
	if player_chase: #もし追跡がtureだったらプレイヤーの位置に移動する
		position += (player.position - position)/speed
		$AnimatedSprite2D.play("walk")
		
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("idle")
		
		
#プレイヤーが敵の範囲内に入ったときの処理
func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true

#プレイヤーが敵の範囲外に出たときの処理
func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	player_chase = false
