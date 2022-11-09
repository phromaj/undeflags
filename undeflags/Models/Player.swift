//
//  Player.swift
//  undeflags
//
//  Created by Robin LITTIERE on 08/11/2022.
//

import Foundation

struct Player: Codable{
    var username: String
    var points: Int
    
}

extension Player {
    init(username: String){
        self.username = username
        self.points = 0
    }
}
