//
//  NewYorkTimesRepositoryImpl.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 17/02/2024.
//

import Foundation

class NewYorkTimesRepositoryImpl: NewsRepository {
   
    private let newYorkTimesRemoteService = NewYorkTimesRemoteService()
    
    func getNewsFromService() async -> MobileNewsDomain {
        let news = await newYorkTimesRemoteService.getNewYorkTimes()
        news.results = Array(news.results.prefix(5))
        print("New York Times FORMATTED---> \(news.results.count)")
        return news
    }
}
