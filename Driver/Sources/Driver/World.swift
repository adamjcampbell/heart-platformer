import SwiftGodot

@Godot
final class World: Node2D {

    @SceneTree(path: "StaticBody2D/CollisionPolygon2D")
    var collisionPolygon2D: CollisionPolygon2D!

    @SceneTree(path: "StaticBody2D/CollisionPolygon2D/Polygon2D")
    var polygon2D: Polygon2D!

    override func _ready() {
        polygon2D.color = .red
    }

}
