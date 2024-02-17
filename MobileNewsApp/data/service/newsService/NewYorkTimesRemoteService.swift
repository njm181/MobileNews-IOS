//
//  NewYorkTimesRemoteService.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 17/02/2024.
//

import Foundation

struct NewYorkTimesRemoteService {
    
    func getNewYorkTimes() async -> NewYorkTimes {
        var components = URLComponents(string: "https://api.nytimes.com/svc/topstories/v2/sports.json")!
        components.queryItems = [
            URLQueryItem(name: "api-key", value: "EalqiYQ1vykAveT5IPbXUvIqgXnRT4wb")
        ]
        guard let url = components.url else {
            print("Error al construir la URL.")
            return NewYorkTimes()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try! await URLSession.shared.data(for: request)
        let newYorkTimesModel = try! JSONDecoder().decode(NewYorkTimes.self, from: data)
        return newYorkTimesModel

        
    }
}
