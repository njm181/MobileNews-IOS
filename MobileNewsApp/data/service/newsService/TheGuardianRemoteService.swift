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
        request.addValue("9b7bec85-cd8c-4543-a31d-6aa226d1eda7", forHTTPHeaderField: "api-key")
        
        let (data, _) = try! await URLSession.shared.data(for: request)
        let newsModel = try! JSONDecoder().decode(TheGuardian.self, from: data)
        return newsModel
    }
}
