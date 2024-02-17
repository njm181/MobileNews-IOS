//
//  Result.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 17/02/2024.
//

import Foundation

class ResultNewYorkTimes: Codable {
    var multimedia: [MultimediaNewYorkTimes] = []
    var title: String = ""
    var url: String = ""
    var abstract: String = ""
}
