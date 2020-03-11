extends Area2D

func _on_Goal_body_entered(body):
    print("You win!")
    SceneTree.pause()
