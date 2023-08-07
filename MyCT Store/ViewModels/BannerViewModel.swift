//
//  BannerViewModel.swift
//  MyCT Store
//
//  Created by R86 on 06/04/23.
//

import Foundation



struct BannerViewModel {
    private let banner: Banner
    
    init(banner: Banner) {
        self.banner = banner
    }
    
    func getId() -> Int{ banner.id }
    func getImage() -> String {
        return Config.baseURLForImage + (banner.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
}
