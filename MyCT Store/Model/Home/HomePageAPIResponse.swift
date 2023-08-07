//
//  HomePageAPIResponse.swift
//  MyCTStore
//
//   Created by R86 on 02/04/23.
//

import Foundation

struct HomePageAPIResponse: Decodable {
    var error: Bool
    var arrStoreTypes: [StoreType]
    var arrBanner: [Banner]
    var arrVendor: [Vendor]
    var numStores: Int
    
    enum CodingKeys: String, CodingKey {
        case error
        case arrStoreTypes = "store_type"
        case numStores = "num_stores"
        case arrVendor = "data"
        case arrBanner = "banner"
    }
}
