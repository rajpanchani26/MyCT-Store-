//
//  APIAndPoint.swift
//  MyCT Store
//
//  Created by R86 on 28/03/23.
//

import Foundation

enum APIEndPoint {
    case getArea
    case getCity
    case homepage
    
    var url: String {
        switch self {
        case .getArea:
            return "\(Config.baseURL)/get_area"
        case .getCity:
            return "\(Config.baseURL)/get_city"
        case .homepage:
            return "\(Config.baseURL)/homepage"
        }
    }
}
