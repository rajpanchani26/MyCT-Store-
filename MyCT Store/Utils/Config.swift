//
//  Config.swift
//  MyCT Store
//
//  Created by R86 on 28/03/23.
//

import Foundation
import UIKit

struct Config{
    static let appName = "MyCT Strore"
    static let databaseName = "myctstore.db"
    static let stroryBord: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    static let androidLink = "https://play.google.com/storr/app/details?id=compragma.myctstore"
    static let iOSLink = "itms-app://itunes.apple.com/us/app/apple-store/idid1552347410?mt=8"
    static let iOSSharingText: String = "Sharing & easly oreder your food"
    static let dateFormet = "dd MM yyyy"
    static let timeFormet = "hh:mm a"
    static let serverDateFormet: String = "yyyy-mm-dd"
    static let amountSing: String = "₹"
    
    static func isInternetAvailable() -> Bool {
        let reachbility = Reachability()!
        return reachbility.isReachable ? (reachbility.isReachableViaWiFi || reachbility.isReachableViaWWAN) : false
    }
    
    static let baseURL: String = "https://myct.store/Mobile_Services/user/v2/index.php/"
    static let baseURLForCategories = "https://myct.store/admin/uploads/food_type/"
    static let baseURLForImage = "https://myct.store/admin/uploads/"
}
