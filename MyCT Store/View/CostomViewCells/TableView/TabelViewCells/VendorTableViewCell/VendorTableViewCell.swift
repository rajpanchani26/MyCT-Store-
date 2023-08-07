//
//  VendorTableViewCell.swift
//  MyCT Store
//
//  Created by Prince Desai on 03/04/23.
//

import UIKit
import SDWebImage

class VendorTableViewCell: UITableViewCell {

    @IBOutlet weak var vendorCollectionView: UICollectionView!
    var arrVendor: [VendorViewModel] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        vendorCollectionView.register(UINib(nibName: VendorCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: VendorCollectionViewCell.identifier)
    }

    func set(arrVendors: [VendorViewModel]) {
        self.arrVendor = arrVendors
        vendorCollectionView.delegate = self
        vendorCollectionView.dataSource = self
        vendorCollectionView.reloadData()
    }
}
extension VendorTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrVendor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: VendorCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: VendorCollectionViewCell.identifier, for: indexPath) as! VendorCollectionViewCell
        let vendor: VendorViewModel = arrVendor[indexPath.row]
        cell.vendorNameLabel.text = vendor.getName()
        cell.vendorImageview.sd_setImage(with: URL(string: vendor.getImage()), placeholderImage: UIImage(systemName: "hourglass.start"))
        print(vendor.getImage())
        return cell
    }
}
extension VendorTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width-20, height: 240)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
}
