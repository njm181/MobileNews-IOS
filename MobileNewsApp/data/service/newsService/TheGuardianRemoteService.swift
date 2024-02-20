//
//  TheGuardianRemoteService.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 17/02/2024.
//

import Foundation

struct TheGuardianRemoteService {
    
    func getNews() async -> TheGuardian {
        var request = URLRequest(url: URL(string: "https://content.guardianapis.com/search?q=economy")!)
        request.addValue(guardianServiceAuth(), forHTTPHeaderField: "api-key")
        
        let (data, _) = try! await URLSession.shared.data(for: request)
        let newsModel = try! JSONDecoder().decode(TheGuardian.self, from: data)
        return newsModel
    }
    
    private func guardianServiceAuth() -> String{
        guard let configPath = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let config = NSDictionary(contentsOfFile: configPath),
              let key = config["GuardianKey"] as? String else {
            fatalError("Config file not found or News Key not specified")
        }
        return key
    }
}
