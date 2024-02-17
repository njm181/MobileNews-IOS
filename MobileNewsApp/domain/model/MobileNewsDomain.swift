//
//  MobileNewsDomain.swift
//  MobileNewsApp
//
//  Created by Nico Molina on 17/02/2024.
//

import Foundation

class MobileNewsDomain {
    var newsType: NewsType {
        return .NO_TYPE
    }
    
    
}
enum NewsType {
    case NO_TYPE
    case THE_GUARDIAN
    case NEWS
    case NEW_YORK_TIMES
}

