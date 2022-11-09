//
//  ApiHandler.swift
//  undeflags
//
//  Created by ADMIN on 08/11/2022.
//

import Foundation

class ApiHandler {
    
    typealias CompletionHandler = (_ flags: [Flag]) -> Void

    static func getAllFlags(completion: @escaping CompletionHandler) {
        
        let url = URL(string:"https://pride.dev/api/flags")
        var flagsFinal:[Flag] = []
        
        // Make the async request and pass the resulting json object to the callback
        let task = URLSession.shared.dataTask(with: url! , completionHandler:  { (data, response, error) in
            do {
                if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers) {
                    if let dataFlags = json as? [[String:AnyObject]] {
                        for flag in dataFlags {
                            
                            if let flag = Flag(json: flag) {
                                flagsFinal.append(flag)
                            }
                            
                        }
                    }
                    
                                        
                    completion(flagsFinal)
                }
            }
        })
        task.resume()
    }

    static func getAllSvgs(flags: [Flag]) -> [String]{
        var svgLinks = [String]()
        for flag in flags {
            svgLinks.append("https://pride.dev/api/flags/\(flag.id)/SVG")
        }
        return svgLinks
    }

    
}

//        getAllFlags { flags in
//DataManager.shared.flags = flags
//}


