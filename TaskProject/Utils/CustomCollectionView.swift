//
//  CustomCollectionView.swift
//  TaskProject
//
//  Created by Erkan Emir on 10.08.23.
//

import UIKit

class CustomCollectionView: UICollectionView {
    
    let layout = UICollectionViewFlowLayout()
    
    init(scroll: UICollectionView.ScrollDirection,
         spacing: CGFloat) {
        super.init(frame: .zero,
                   collectionViewLayout: layout)
        layout.scrollDirection = scroll
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been") }
    
    func configureCollectionView() {
        self.showsVerticalScrollIndicator   = false
        self.showsHorizontalScrollIndicator = false
    }
}

import UIKit

class CustomCollectionView2: UICollectionView {
    
    //MARK: - Properties
    let layout = UICollectionViewFlowLayout()
    
    //MARK: - Lifecycle
    init(scroll        : UICollectionView.ScrollDirection,
         spacing       : CGFloat,
         delegate      : UICollectionViewDelegate,
         dataSource    : UICollectionViewDataSource,
         registerCell  : UICollectionViewCell.Type,
         registerHeader: UICollectionReusableView.Type? = nil,
         registerFooter: UICollectionReusableView.Type? = nil ) {
        
        super.init(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection         = scroll
        layout.minimumLineSpacing      = spacing
        layout.minimumInteritemSpacing = spacing
        
        self.delegate   = delegate
        self.dataSource = dataSource
        
        configureCollectionView()
        
        self.register(registerCell, forCellWithReuseIdentifier: "\(registerCell)")

        if let registerHeader = registerHeader {
            self.register(registerHeader, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(registerHeader.self)")
        }
        
        if let registerFooter = registerFooter {
            self.register(registerFooter, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "\(registerFooter.self)")
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been") }
    
    //MARK: - Helper
    
    private func configureCollectionView() {
        self.showsVerticalScrollIndicator   = false
        self.showsHorizontalScrollIndicator = false
    }
}

extension UICollectionView {
    func configureContentInset(top: CGFloat,left: CGFloat,
                               right: CGFloat,bottom: CGFloat) {
        self.contentInset.top   = top
        self.contentInset.left  = left
        self.contentInset.right = right
        self.contentInset.right = bottom

    }
}

