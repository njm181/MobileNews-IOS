//
//  ArticleDTO.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 14/02/2024.
//

import Foundation

struct Article: Codable {
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
}
