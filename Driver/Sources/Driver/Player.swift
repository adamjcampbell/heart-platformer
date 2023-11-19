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

    @SceneTree(path: "AnimatedSprite2D") var animatedSprite2D: AnimatedSprite2D!
    @SceneTree(path: "CoyoteJumpTimer") var coyoteJumpTimer: Timer!

    override func _physicsProcess(delta: Double) {
        guard Engine.isEditorHint() == false else {
            return
        }

        let delta = Float(delta)

        // Apply gravity
        if isOnFloor() == false {
            velocity.y += gravity * delta
        }

        // Handle jump
        if isOnFloor() || coyoteJumpTimer.timeLeft > 0, Input.isActionJustPressed(action: "ui_up") {
            velocity.y = jumpVelocity
        } else if Input.isActionJustReleased(action: "ui_up"), velocity.y < jumpVelocity / 2 {
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

        // Animation
        if inputAxis != .zero {
            animatedSprite2D.flipH = inputAxis < 0
            animatedSprite2D.play(name: "run")
        } else {
            animatedSprite2D.play(name: "idle")
        }

        if isOnFloor() == false {
            animatedSprite2D.play(name: "jump")
        }

        let wasOnFloor = isOnFloor()

        moveAndSlide()

        let wasOnLedge = wasOnFloor && isOnFloor() == false && velocity.y >= 0

        if wasOnLedge {
            coyoteJumpTimer.start()
        }
    }

}
