//
//  NewsResponseDTO.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 14/02/2024.
//

import Foundation


class News: MobileNewsDomain, Codable {
    var articles: [Article] = []
    
    override var newsType: NewsType {
        return .NEWS
    }
}



