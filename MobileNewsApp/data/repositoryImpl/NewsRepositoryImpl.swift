//
//  NewsRepositoryImpl.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 14/02/2024.
//

import Foundation

class NewsRepositoryImpl: NewsRepository {
    
    private let newsRemoteService = NewsRemoteService()
    
    
    func getNewsFromService() async -> [Article] {
        let news = await newsRemoteService.getNews()
        print("News ---> \(Array(news.articles.prefix(5)).count)")
        return Array(news.articles.prefix(5))
    }
    
    
}
