//
//  ViewModel.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 09/02/2024.
//

import Foundation

final class ViewModel {
    
    private let repository: NewsRepository = NewsRepositoryImpl()
    
    func executeApi() async{
        await repository.getNewsFromService()
    }
}
