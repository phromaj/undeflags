//
//  PlayerDataManager.swift
//  undeflags
//
//  Created by Robin LITTIERE on 08/11/2022.
//

import Foundation

class PlayerDataManager {
    var player: Player
    
    init(player: Player) {
        self.player = player
    }
    
    func addPoint(){
        self.player.points += 1
    }
}
