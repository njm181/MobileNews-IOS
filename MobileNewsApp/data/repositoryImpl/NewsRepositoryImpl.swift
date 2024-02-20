//
//  NewsRepositoryImpl.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 14/02/2024.
//

import Foundation

class NewsRepositoryImpl: NewsRepository {
    
    private let newsRemoteService = NewsRemoteService()
    
    
    func getNewsFromService() async -> MobileNewsDomain {
        let news = await newsRemoteService.getNews()
        news.articles = Array(news.articles.prefix(5))
        return news
    }
    
    
}
