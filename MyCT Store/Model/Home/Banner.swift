//
//  Banner.swift
//  MyCTStore
//
//   Created by R86 on 02/04/23.
//

import Foundation

struct Banner: Decodable {
    var id: Int
    var image: String
    
    enum CodingKeys: String, CodingKey{
        case id = "v_id"
        case image = "filename"
    }
}

