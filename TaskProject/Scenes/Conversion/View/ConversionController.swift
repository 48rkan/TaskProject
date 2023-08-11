//
//  ConversionController.swift
//  TaskProject
//
//  Created by Erkan Emir on 11.08.23.
//

import UIKit

class ConversionController: UIViewController {
    
    //MARK: - Properties
    var viewModel = ConversionViewModel()
    
    private lazy var segmentControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Alış","Satış"])
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(segmentControlDidChanged), for: .valueChanged)
        return sc
    }()
    
    private lazy var table: UITableView = {
        let t = UITableView()
        t.delegate        = self
        t.dataSource      = self
        t.rowHeight       = 60
        t.isScrollEnabled = false
        t.separatorStyle  = .none
        t.register(ConversionCell.self, forCellReuseIdentifier: "\(ConversionCell.self)")
        return t
    }()
        
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.successCallBack = { self.table.reloadData() }
    }
    
    //MARK: - Actions
    @objc func segmentControlDidChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            viewModel.fetchData()
        case 1:
            viewModel.fetchSaleData()

        case _ : break
        }
    }
    
    //MARK: - Helper
    func configureUI() {
        view.backgroundColor = .white

        view.addSubview(segmentControl)
        segmentControl.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 12,paddingLeft: 72,paddingRight: 72)
        segmentControl.setHeight(40)
        
        view.addSubview(table)
        table.anchor(top: segmentControl.bottomAnchor,
                          left: view.leftAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          right: view.rightAnchor,
                          paddingTop: 12,paddingLeft: 4,
                          paddingBottom: 4,paddingRight: 4)
    }
}

//MARK: - UICollectionViewDelegate
extension ConversionController: UITableViewDelegate { }

//MARK: - UICollectionViewDataSource
extension ConversionController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "\(ConversionCell.self)") as! ConversionCell
        cell.viewModel = ConversionCellViewModel(item: viewModel.items[indexPath.row])
        return cell
    }
}

//MARK: - Header
extension ConversionController {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        HeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
}

