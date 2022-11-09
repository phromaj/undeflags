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
        
        // Make the async request and pass the resulting json object to the callback
        let task = URLSession.shared.dataTask(with: url! , completionHandler:  { (data, response, error) in
            do {
                if (try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]) != nil {
                    let flags =  self.parse(json: data!)
                                        
                    completion(flags)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }

    static func getAllSvgs(flags: [Flag]) -> [URL]{
        var svgLinks = [URL]()
        for flag in flags {
            svgLinks.append(URL(string: "https://pride.dev/api/flags/\(flag.id)/SVG")!)
        }
        return svgLinks
    }

    
    static func parse(json: Data) -> [Flag] {
        let decoder = JSONDecoder()
        if let flags = try? decoder.decode(Flag.self, from: json) {
            return [flags]
        }
        return []
    }
    
}

//        getAllFlags { flags in
//DataManager.shared.flags = flags
//}


