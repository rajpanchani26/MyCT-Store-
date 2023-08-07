//
//  DeleveryTableViewCell.swift
//  MyCT Store
//
//   Created by R86 on 31/03/23.
//

import UIKit
protocol DeliveryOptionTableViewCellDelegate: AnyObject {
    func didSelectIndexOf(index: Int)
}

class DeleveryTableViewCell: UITableViewCell {

    @IBOutlet weak var deliveryOptionSegment: UISegmentedControl!
    weak var delegate: DeliveryOptionTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        deliveryOptionSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor .white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)], for: .selected)
        deliveryOptionSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor .black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)], for: .normal)
        deliveryOptionSegment.backgroundColor = UIColor.clear
    }
    func set(selectedIndex: Int){
        deliveryOptionSegment.selectedSegmentIndex = selectedIndex
    }
    @IBAction func deliveryOptionSegmentTapped(_ sender: UISegmentedControl){
        delegate?.didSelectIndexOf(index: sender.selectedSegmentIndex)
    }
}




