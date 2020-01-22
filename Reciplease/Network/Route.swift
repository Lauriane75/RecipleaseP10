//
//  Route.swift
//  Reciplease
//
//  Created by Lauriane Haydari on 04/12/2019.
//  Copyright © 2019 Lauriane Haydari. All rights reserved.
//

import UIKit

final class Route {
    //    let applicationId = "1fa15c75"
    //    let apiKey = "10de3dd78457ffd6bc0c0f3e90efa30c"
    
    let applicationId = "62c96409"
    let apiKey = "8e307bbd2479873f8f403b776dafe023"
    
    func getURL (ingredients: String) -> URL? {
        let urlAdress = "https://api.edamam.com/search?q=\(ingredients)&app_id=\(applicationId)&app_key=\(apiKey)"
        
        guard let urlString = urlAdress.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return nil }
        
        guard let url = URL(string: urlString) else { return nil }
        return url
    }
}
