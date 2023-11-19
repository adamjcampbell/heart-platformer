import SwiftGodot

@Godot
final class Player: CharacterBody2D {

    private let speed: Float = 200.0
    private let jumpVelocity: Float = -300.0

    private var gravity: Float {
        .init(
            ProjectSettings.getSettingWithOverride(name: "physics/2d/default_gravity")
        )!
    }

    override func _physicsProcess(delta: Double) {
        // Add gravity
        if isOnFloor() == false {
            velocity.y += gravity * .init(delta)
        }

        // Handle jump
        if Input.isActionJustPressed(action: "ui_accept"), isOnFloor() {
            velocity.y = jumpVelocity
        }

        // Handle movement or deceleration
        let direction = Input.getAxis(negativeAction: "ui_left", positiveAction: "ui_right")
        if direction != .zero {
            velocity.x = .init(direction) * speed
        } else {
            velocity.x = Float(GD.moveToward(from: .init(velocity.x), to: 0, delta: .init(speed)))
        }

        moveAndSlide()
    }

}
