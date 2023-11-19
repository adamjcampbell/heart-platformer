import SwiftGodot

let allNodes: [SwiftGodot.Wrapped.Type] = [
    World.self
]

#initSwiftExtension(cdecl: "swift_entry_point", types: allNodes)
