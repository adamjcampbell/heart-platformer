import SwiftGodot

@Godot
final class World: Node2D {

    @SceneTree(path: "StaticBody2D/CollisionPolygon2D")
    var collisionPolygon2D: CollisionPolygon2D!

    @SceneTree(path: "StaticBody2D/CollisionPolygon2D/Polygon2D")
    var polygon2D: Polygon2D!

    override func _ready() {
        guard Engine.isEditorHint() == false else {
            return
        }

        polygon2D.polygon = collisionPolygon2D.polygon

        RenderingServer.setDefaultClearColor(.black)
    }

}
