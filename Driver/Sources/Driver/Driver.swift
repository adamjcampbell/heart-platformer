import SwiftGodot

let allNodes: [SwiftGodot.Wrapped.Type] = [
    World.self,
    Player.self,
]

#initSwiftExtension(cdecl: "swift_entry_point", types: allNodes)
