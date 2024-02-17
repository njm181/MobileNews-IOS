//
//  TheGuardian.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 17/02/2024.
//

import Foundation

class TheGuardian: MobileNewsDomain, Codable {
    var response: ResponseTheGuardian
    
    override var newsType: NewsType {
        return .THE_GUARDIAN
    }
}
