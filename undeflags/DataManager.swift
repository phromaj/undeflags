//
//  DataManager.swift
//  undeflags
//
//  Created by ADMIN on 08/11/2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    var flags: [Flag]?
    var svgLinks: [URL]?
    
    private init() { }
}
