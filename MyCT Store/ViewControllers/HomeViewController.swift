//
//  HomeViewController.swift
//  MyCT Store
//
//  Created by R86 on 31/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var tabelView: UITableView!
    // MARK: - Variable
    var viewModel: HomeViewModel = HomeViewModel()
    var tabelViewCells = [LocationTableViewCell.identifier, CategoriesTableViewCell.identifier, BannerTableViewCell.identifier, DeleveryTableViewCell.identifier,VendorTableViewCell.identifier]
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDetalis()
        tabelViewCells.forEach { cell in
            tabelView.register(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
            tabelView.separatorStyle = .none
        }
    }
    private func fetchResponse(){
        viewModel.fetchDetalis { result in
            switch result {
            case .success:
                self.tabelView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Get Home Page Detalis
    
    
    
    private func fetchDetalis() {
        guard Config.isInternetAvailable() else {
            print("Display No internet avalible popup")
            return
        }
        
        viewModel.fetchDetalis { result in
            switch result {
            case .success:
                print("Reload TableView")
                self.tabelView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
//MARK: - TABLEVIEW METHODS
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numOfRowInsection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        switch indexPath.section {
        case 0:
            let cell: LocationTableViewCell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier) as! LocationTableViewCell
            return cell
        case 1:
            let cell: CategoriesTableViewCell = tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.identifier) as! CategoriesTableViewCell
            cell.delegate = self
            cell.set(arrCategories: viewModel.arrCategories, selectedCategoryIndex: viewModel.selectedCategoryIndex)
            return cell
        case 2:
            let cell: BannerTableViewCell = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.identifier) as! BannerTableViewCell
            cell.set(arrBanner: viewModel.arrBanner)
            return cell
        case 3:
            let cell: DeleveryTableViewCell = tableView.dequeueReusableCell(withIdentifier: DeleveryTableViewCell.identifier) as! DeleveryTableViewCell
            return cell
        case 4:
            let cell: VendorTableViewCell = tableView.dequeueReusableCell(withIdentifier: VendorTableViewCell.identifier) as! VendorTableViewCell
            cell.set(arrVendors: viewModel.arrVendor)
            return cell
        default:  return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 106
        case 2: return 160
        case 3: return 61
        case 4: return tableView.frame.height
        default: return 44
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0: return 0
        case 1: return 8
        case 2: return 0
        case 3: return 16
        default: return 16
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 16))
        return headerView
    }
}
extension HomeViewController: CategoriesTableViewCellDelegate {
    func didSelectCategories(at index: Int){
        viewModel.updateIndex(selectedCategoryIndex: index)
        tabelView.reloadData()
        fetchResponse()
    }
}

extension HomeViewController: DeliveryOptionTableViewCellDelegate {
    func didSelectIndexOf(index: Int) {
        viewModel.updateIndexOf(selectedDeliveryIndex: index)
        tabelView.reloadData()
        fetchResponse()
    }
}

extension HomeViewController: BannerTableViewCellDelegat {
    func didSelectBanner(at index: Int) {
        print(index)
    }
    
    
}



