// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let flags = try? newJSONDecoder().decode(Flags.self, from: jsonData)

import Foundation

// MARK: - Flag
struct Flag: Codable {
    let name, id, year, emoji: String
    let colors: [Color]
    let svg: String
}

// MARK: - Color
struct Color: Codable {
    let name, hexCode: String
    let r, g, b: Int
}
