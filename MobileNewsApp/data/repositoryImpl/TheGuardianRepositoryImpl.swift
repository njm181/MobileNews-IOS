//
//  TheGuardianRepositoryImpl.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 17/02/2024.
//

import Foundation

class TheGuardianRepositoryImpl: NewsRepository {
    
    private let theGuardianRemoteService = TheGuardianRemoteService()
    
    func getNewsFromService() async -> MobileNewsDomain {
        let news = await theGuardianRemoteService.getNews()
        news.response.results = Array(news.response.results.prefix(5))
        print("News FORMATTED---> \(news.response.results.count)")
        return news
    }
    
    
}
