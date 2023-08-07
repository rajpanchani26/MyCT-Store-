//
//  VendorCollectionViewCell.swift
//  MyCT Store
//
//  Created by R86 on 05/04/23.
//

import UIKit
import Cosmos

class VendorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var cosmosView: CosmosView!
    
    @IBOutlet weak var minOrderLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var vendorNameLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
   
    @IBOutlet weak var vendorImageview: UIImageView!
   
    @IBOutlet weak var viewMoreButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
