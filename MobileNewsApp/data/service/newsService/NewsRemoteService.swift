//
//  NewsRemoteService.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 14/02/2024.
//

import Foundation

struct NewsRemoteService {
    
    func getNews() async -> News {
        var request = URLRequest(url: URL(string: "https://newsapi.org/v2/everything?q=bitcoin")!)
        request.addValue("Bearer \(newsServiceAuth())", forHTTPHeaderField: "Authorization")
        
        let (data, _) = try! await URLSession.shared.data(for: request)
        let newsModel = try! JSONDecoder().decode(News.self, from: data)
        return newsModel
    }
    
    private func newsServiceAuth() -> String{
        guard let configPath = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let config = NSDictionary(contentsOfFile: configPath),
              let key = config["NewsKey"] as? String else {
            fatalError("Config file not found or News Key not specified")
        }
        return key
    }
    
}
