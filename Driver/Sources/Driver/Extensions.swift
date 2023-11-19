import SwiftGodot

extension GD {

    public static func moveToward(from: Float, to: Float, delta: Float) -> Float {
        Float(GD.moveToward(from: Double(from), to: Double(to), delta: Double(delta)))
    }

}

extension Input {

    public static func getAxis(negativeAction: StringName, positiveAction: StringName) -> Float {
        Float(getAxis(negativeAction: negativeAction, positiveAction: positiveAction) as Double)
    }

}
