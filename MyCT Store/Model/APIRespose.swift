//
//  APIRespose.swift
//  MyCT Store
//
//  Created by R86 on 02/04/23.
//

import Foundation

struct ApiResponse: Decodable {
    var error: Bool
    var data: [Area]
}
