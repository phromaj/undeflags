//
//  PlayerDataManager.swift
//  undeflags
//
//  Created by Robin LITTIERE on 08/11/2022.
//

import Foundation

class PlayerDataManager {
    static let shared = PlayerDataManager()
    private init(){}

    var player: Player?

    
    func setPlayer(player: Player) {
        self.player = player
    }
    
    func addPoint(){
        self.player?.points += 1
    }
    
    func savePlayerData(){
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(self.player)
            let defaults = UserDefaults.standard
            defaults.set(data, forKey: "player")

        } catch {
            print("Unable to store player data (\(error))")
        }
    }
    
}
