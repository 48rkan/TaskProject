//
//  CurrencyController.swift
//  TaskProject
//
//  Created by Erkan Emir on 10.08.23.
//

import UIKit

class CurrencyController: UIViewController {
    
    //MARK: - Properties
    var viewModel = CurrencyViewModel()
    
    private lazy var segmentControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Nağdsız","Nağd"])
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(segmentControlDidChanged), for: .valueChanged)
        return sc
    }()
    
    private lazy var collection: CustomCollectionView = {
        let c = CustomCollectionView(scroll: .vertical, spacing: 16)
        c.contentInset.right  = 8
        c.contentInset.left   = 8
        c.register(CurrencyHeader.self,
                   forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                   withReuseIdentifier: "\(CurrencyHeader.self)")
//        c.register(FeedFooter.self,
//                   forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
//                   withReuseIdentifier: "\(FeedFooter.self)")
        c.register(CurrencyCell.self,
                   forCellWithReuseIdentifier: "\(CurrencyCell.self)")
        c.delegate   = self
        c.dataSource = self
        
        return c
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        viewModel.successCallBack = { self.collection.reloadData() }
    }
    
    //MARK: - Actions
    @objc func segmentControlDidChanged(sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
    
    //MARK: - Helper
    func configureUI() {
        view.backgroundColor = .white

        view.addSubview(segmentControl)
        segmentControl.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 12,paddingLeft: 12,paddingRight: 12)
        segmentControl.setHeight(40)
        
        view.addSubview(collection)
        collection.anchor(top: segmentControl.bottomAnchor,
                          left: view.leftAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          right: view.rightAnchor,
                          paddingTop: 12,paddingLeft: 4,
                          paddingBottom: 4,paddingRight: 4)

    }
}

//MARK: - UICollectionViewDelegate
extension CurrencyController: UICollectionViewDelegate { }

//MARK: - UICollectionViewDataSource
extension CurrencyController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "\(CurrencyCell.self)", for: indexPath) as! CurrencyCell
        cell.viewModel = CurrencyCellViewModel(item: viewModel.items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collection.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(CurrencyHeader.self)", for: indexPath) as! CurrencyHeader

            return header
            
//        case UICollectionView.elementKindSectionFooter:
//            let footer = collection.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(FeedFooter.self)", for: indexPath) as! FeedFooter
//            footer.delegate = self
//            return footer
        default:
            return UICollectionReusableView()
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension CurrencyController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width - 12, height: 52)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: view.frame.width - 12, height: 40)
    }
}
