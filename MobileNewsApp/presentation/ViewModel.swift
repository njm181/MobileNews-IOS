//
//  ViewModel.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 09/02/2024.
//

import Foundation

final class ViewModel: ObservableObject {
    
    @Published var resultNewsArticlesList: [Article] = []
    @Published var resultNewYorkTimesArticlesList: [ResultNewYorkTimes] = []
    @Published var resultTheGuardianArticlesList: [ResultTheGuardian] = []
    @Published var isLoading: Bool = true
    
    private let newsRepository: NewsRepository = NewsRepositoryImpl()
    private let newYorkTimesRepository: NewsRepository = NewYorkTimesRepositoryImpl()
    private let theGuardianRepository: NewsRepository = TheGuardianRepositoryImpl()
    
    func getAllNews() async {
        //let news = await newsRepository.getNewsFromService() as! News
        //let newYorkTimes = await newYorkTimesRepository.getNewsFromService() as! NewYorkTimes
        let theGuardian = await theGuardianRepository.getNewsFromService() as! TheGuardian
        
        //self.resultNewsArticlesList = news.articles
        //self.resultNewYorkTimesArticlesList = newYorkTimes.results
        self.resultTheGuardianArticlesList = theGuardian.response.results
        isLoading = false
    }
}
