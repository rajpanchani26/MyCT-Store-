//
//  LocationTableViewCell.swift
//  MyCT Store
//
//  Created by Prince Desai on 29/03/23.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var areaView: UIView!
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
   
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var areaButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var searchBar: UISearchBar!

    override func awakeFromNib() {
        super.awakeFromNib()
       
        selectionStyle = .none
        backgroundColor = AppColors.primaryColor
    
        selectionStyle = .none
        backgroundColor = AppColors.primaryColor
        
        cityView.setCorner(radius: 5)
        areaView.setCorner(radius: 5)
        
        cityView.setBorder(width: 1, color: UIColor.white)
        areaView.setBorder(width: 1, color: UIColor.white)
        
        cityButton.setTitle("Adajan", for: .normal)
        areaButton.setTitle("Surat", for: .normal)
        
        cityButton.setTitleColor(UIColor.white, for: .normal)
        areaButton.setTitleColor(UIColor.white, for: .normal)
        
        searchBar.tintColor = AppColors.primaryColor
        searchBar.barTintColor = AppColors.primaryColor
        searchBar.backgroundColor = AppColors.primaryColor
        
        searchBar.isTranslucent = false
        let textFielInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFielInsideSearchBar?.font = UIFont.systemFont(ofSize: 14)
        textFielInsideSearchBar?.attributedPlaceholder = NSAttributedString(string: PlaceHolders.searchBar, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)])
        textFielInsideSearchBar?.setCorner(radius: 8)
        
    }
    
}
