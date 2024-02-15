//
//  NewsResponseDTO.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 14/02/2024.
//

import Foundation


struct News: Codable {
    let status: String
    let articles: [Article]
    
}



