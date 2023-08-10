//
//  FeedController.swift
//  TaskProject
//
//  Created by Erkan Emir on 10.08.23.
//

import UIKit

class FeedController: UIViewController {
    
    //MARK: - Properties
    private lazy var collection: CustomCollectionView = {
        let c = CustomCollectionView(scroll: .vertical, spacing: 16)
        c.contentInset.right  = 8
        c.contentInset.left   = 8
        c.contentInset.top    = 8
        c.contentInset.bottom = 8
        c.register(FeedHeader.self,
                   forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                   withReuseIdentifier: "\(FeedHeader.self)")
        c.register(FeedFooter.self,
                   forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                   withReuseIdentifier: "\(FeedFooter.self)")
        c.register(FeedCell.self,
                   forCellWithReuseIdentifier: "\(FeedCell.self)")
        c.delegate   = self
        c.dataSource = self
        c.backgroundColor = .white
        
        return c
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureUI()
    }
}

//MARK: - Helper
extension FeedController {
    func configure() {
        DispatchQueue.main.async {
            if !UserDefaults.standard.bool(forKey: "USER_IS_LOGIN") {
                let controller      = LoginController()
                controller.delegate = self
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                
                self.present(nav, animated: false)
            } else {
            }
        }

    }
    
    func configureUI() {
        view.addSubview(collection)
        collection.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.leftAnchor,bottom: view.bottomAnchor,right: view.rightAnchor,paddingTop: 4,paddingLeft: 4,paddingBottom: 4,paddingRight: 4)
    }
}

//MARK: - UICollectionViewDelegate
extension FeedController: UICollectionViewDelegate { }

//MARK: - UICollectionViewDataSource
extension FeedController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MenuFilterOptions.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "\(FeedCell.self)", for: indexPath) as! FeedCell
        let item = MenuFilterOptions.allCases[indexPath.row]
        cell.viewModel = FeedCellViewModel(items: (item.title,
                                                   item.description,
                                                   item.imageName))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collection.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(FeedHeader.self)", for: indexPath) as! FeedHeader
            header.viewModel = FoodHeaderViewModel()
            return header
            
        case UICollectionView.elementKindSectionFooter:
            let footer = collection.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(FeedFooter.self)", for: indexPath) as! FeedFooter
            footer.delegate = self
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}

extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width / 2 - 24, height: 124)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width , height: 108)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width , height: 100)
    }
}

//MARK: - LoginControllerDelegate
extension FeedController: LoginControllerDelegate {
    func didFinishAuth() {
        self.collection.reloadData()
    }
}

//MARK: - FeedFooterDelegate
extension FeedController: FeedFooterDelegate {
    func tappedFooter(_ footer: FeedFooter) {
        let controller      = LoginController()
        controller.delegate = self
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        
        self.present(nav, animated: false)
        
        UserDefaults.standard.setValue(false, forKey: "USER_IS_LOGIN")

    }
}
