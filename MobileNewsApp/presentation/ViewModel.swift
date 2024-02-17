//
//  ViewModel.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 09/02/2024.
//

import Foundation

final class ViewModel: ObservableObject {
    
    @Published var newsArticleList: [Article] = []
    
    private let repository: NewsRepository = NewsRepositoryImpl()
    
    func getNews() async{
        self.newsArticleList = await repository.getNewsFromService()
    }
}
