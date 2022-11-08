//
//  ApiHandler.swift
//  undeflags
//
//  Created by ADMIN on 08/11/2022.
//

import Foundation
typealias CompletionHandler = (_ flags: [Flag]) -> Void

public var svgLinks = [URL]()

func getAllFlags(completion: @escaping CompletionHandler) {
    
    let url = URL(string:"https://pride.dev/api/flags")
    
    // Make the async request and pass the resulting json object to the callback
    let task = URLSession.shared.dataTask(with: url! , completionHandler:  { (data, response, error) in
        do {
            if (try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]) != nil {
                let flags =  parse(json: data!)
                
                getAllSvgs(flags: <#T##[Flag]#>)
                
                completion(flags)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    })
    task.resume()
}

func getAllSvgs(flags: [Flag]) -> Void{
    for flag in flags {
        svgLinks.append(URL(string: "https://pride.dev/api/flags/\(flag.id)/SVG")!)
    }
}

func parse(json: Data) -> [Flag] {
    let decoder = JSONDecoder()
    if let flags = try? decoder.decode(Flag.self, from: json) {
        return [flags]
    }
}
