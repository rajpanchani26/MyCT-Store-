//
//  CategaryTableViewCell.swift
//  MyCT Store
//
//  Created by Prince Desai on 29/03/23.
//

import UIKit

protocol CategoriesTableViewCellDelegate: AnyObject {
    func didSelectCategories(at index: Int)
}

class CategaryTableViewCell: UITableViewCell {

    @IBOutlet weak var viewMoreButton: UIButton!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var selectedCategoryIndex: Int = 0
    weak var delegate: CategoriesTableViewCellDelegate?
    var arrCategories: [StoreTypeViewModel] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        categoryCollectionView.register(UINib(nibName: CategaryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategaryCollectionViewCell.identifier)
    }
    func set(arrCategories: [StoreTypeViewModel], selectedCategoryIndex: Int) {
        self.arrCategories = arrCategories
        self.selectedCategoryIndex = selectedCategoryIndex
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.reloadData()
    }
    @IBAction func viewMoreButtonTapped(_ sender: UIButton){
    }
    
}

//MARK: - COLLECTIONVIEW DELEGATE AND DATASOURCE METHODS
extension CategaryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {  return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategaryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategaryCollectionViewCell.identifier, for: indexPath) as! CategaryCollectionViewCell
        cell.backgroundColor = AppColors.primaryColor
        if selectedCategoryIndex == indexPath.row {
            cell.backgroundColor = AppColors.primaryColor
            cell.nameLabel.textColor = .white
            cell.nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        } else {
            cell.backgroundColor = .white
            cell.nameLabel.textColor = AppColors.primaryColor
            cell.nameLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
            cell.setBorder(width: 1, color: AppColors.primaryColor)
        }
        let category: StoreTypeViewModel = arrCategories[indexPath.row]
        cell.nameLabel.text = category.getType()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
         delegate?.didSelectCategories(at: indexPath.row)
    }
}

extension CategaryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 95, height: 38)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
