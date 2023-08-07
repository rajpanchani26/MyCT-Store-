//
//  BanerTableViewCell.swift
//  MyCT Store
//
//  Created by Prince Desai on 29/03/23.
//

import UIKit
import SDWebImage

protocol BannerTableViewCellDelegat: AnyObject {
    func didSelectBanner(at index: Int)
}

class BanerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bennerCollectionView: UICollectionView!
    var arrBanner: [BannerViewModel] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        bennerCollectionView.register(UINib(nibName: BanerColletionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: BanerColletionViewCell.identifier)
    }
    //MARK: - FUNCTION
        func set(arrBanner: [BannerViewModel]) {
            self.arrBanner = arrBanner
            bennerCollectionView.delegate = self
            bennerCollectionView.dataSource = self
            bennerCollectionView.reloadData()
        }
}

//MARK: - COLLECTIONVIEW DELEGATE AND DATASOURCE METHODES
extension BanerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrBanner.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BanerColletionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BanerColletionViewCell.identifier, for: indexPath) as! BanerColletionViewCell
        let banner: BannerViewModel = arrBanner[indexPath.row]
        cell.imgView.sd_setImage(with: URL(string: banner.getImage()), placeholderImage: UIImage(systemName: "hourglass.start"))
        return cell
    }
}

//MARK: - COLLECTIONVIEW FLOWLAYOUT METHODE
extension BanerTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
