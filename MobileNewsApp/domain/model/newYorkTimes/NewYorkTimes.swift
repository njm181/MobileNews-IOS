//
//  NewYorkTimes.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 17/02/2024.
//

import Foundation

class NewYorkTimes: MobileNewsDomain, Codable {
    var results: [ResultNewYorkTimes] = []
    
    override var newsType: NewsType {
        return .NEW_YORK_TIMES
    }
}
