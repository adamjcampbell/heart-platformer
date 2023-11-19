import SwiftGodot

@Godot
final class Player: CharacterBody2D {

    private let speed: Float = 100.0
    private let acceleration: Float = 800.0
    private let friction: Float = 1000.0
    private let jumpVelocity: Float = -300.0

    private var gravity: Float {
        .init(ProjectSettings.getSettingWithOverride(name: "physics/2d/default_gravity"))!
    }

    override func _physicsProcess(delta: Double) {
        guard Engine.isEditorHint() == false else {
            return
        }

        let delta = Float(delta)
        let isOnFloor = isOnFloor()

        // Apply gravity
        if isOnFloor == false {
            velocity.y += gravity * delta
        }

        // Handle jump
        if isOnFloor, Input.isActionJustPressed(action: "ui_accept") {
            velocity.y = jumpVelocity
        } else if Input.isActionJustReleased(action: "ui_accept"), velocity.y < jumpVelocity / 2 {
            velocity.y = jumpVelocity / 2
        }

        let inputAxis: Float = Input.getAxis(negativeAction: "ui_left", positiveAction: "ui_right")

        if inputAxis != .zero {
            // Accelerate
            velocity.x = GD.moveToward(from: velocity.x, to: speed * inputAxis, delta: acceleration * delta)
        } else {
            // Apply friction
            velocity.x = GD.moveToward(from: velocity.x, to: 0, delta: friction * delta)
        }

        moveAndSlide()
    }

}
