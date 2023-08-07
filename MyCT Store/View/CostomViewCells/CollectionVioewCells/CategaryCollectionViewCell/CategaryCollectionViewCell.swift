//
//  CategaryCollectionViewCell.swift
//  MyCT Store
//
//  Created by R86 on 05/04/23.
//

import UIKit

class CategaryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setCorner(radius: 4)
    }

}
