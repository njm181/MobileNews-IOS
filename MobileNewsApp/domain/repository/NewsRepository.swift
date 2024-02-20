//
//  NewsRepository.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 14/02/2024.
//

import Foundation

protocol NewsRepository {
    func getNewsFromService() async -> MobileNewsDomain
}
