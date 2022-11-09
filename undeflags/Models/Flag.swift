// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let flags = try? newJSONDecoder().decode(Flags.self, from: jsonData)

import Foundation

// MARK: - Flag
struct Flag {
    let name, id, year, svg: String
}

extension Flag {
    init?(json: [String: AnyObject]) {
        guard let name = json["name"] as? String,
            let id = json["id"] as? String,
            let year = json["year"] as? String,
              let svg = json["svg"] as? String
        else {
            return nil
        }

        self.name = name
        self.id = id
        self.year = year
        self.svg = svg
    }
}
