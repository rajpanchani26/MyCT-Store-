//
//  VendorViewModel.swift
//  MyCT Store
//
//  Created by R86 on 06/04/23.
//

import Foundation

struct VendorViewModel {
    private let vendor: Vendor
    
    init(vendor: Vendor) {
        self.vendor = vendor
    }
    
    func getId() -> String { vendor.id }
    func getName() -> String { vendor.businessName }
    func getImage() -> String {
        return Config.baseURLForImage + (vendor.image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }
    
    func isOpen() -> Bool { vendor.isOpen == "Open" }
    func getDeliveryChargers() -> String{
       return String(format: "$%f", Float(vendor.deliveryChargers) ?? 0)
    }
    
    func getMinimumOrder() -> String {
        return "Min. order: $\(vendor.minOrder)"
    }
    
    func getRating() -> Float { Float(vendor.rating) ?? 0 }
    func isFav() -> Bool { vendor.favouriteVendor == "yes" }
}
