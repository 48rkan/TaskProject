//
//  CurrencyHeader.swift
//  TaskProject
//
//  Created by Erkan Emir on 10.08.23.
//

import UIKit

class CurrencyHeader: UICollectionReusableView {
    
    //MARK: - Properties
    var viewModel = FoodHeaderViewModel() {
        didSet { configure() }
    }
    
    private lazy var label1: CustomLabel = {
        let l = CustomLabel(text: "Məzənnə",
                            textColor: .lightGray,
                            systemfont: UIFont.boldSystemFont(ofSize: 14),
                            alignment: .left,numberOfLines: 0)
        return l
    }()
    
    private lazy var label2: CustomLabel = {
        let l = CustomLabel(text: "Alış",
                            textColor: .lightGray,
                            systemfont: UIFont.boldSystemFont(ofSize: 14),
                            alignment: .center,numberOfLines: 0)
        return l
    }()
    
    private lazy var label3: CustomLabel = {
        let l = CustomLabel(text: "Satış",
                            textColor: .lightGray,
                            systemfont: UIFont.boldSystemFont(ofSize: 14),
                            alignment: .right,numberOfLines: 0)
        return l
    }()
    
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been") }
    
    func configureUI() {
        addSubview(label1)
        label1.centerY(inView: self,leftAnchor: leftAnchor,paddingLeft: 12)
        
        addSubview(label2)
        label2.centerY(inView: self)
        label2.centerY(inView: self,leftAnchor: label1.rightAnchor,paddingLeft: 92)

        addSubview(label3)
        label3.centerY(inView: self)
        label3.anchor(right: rightAnchor,paddingRight: 20)
        
        let dividerView = UIView()
        addSubview(dividerView)
        dividerView.backgroundColor = .lightGray
        dividerView.anchor(top: label1.bottomAnchor,left: leftAnchor,right: rightAnchor,paddingTop: 8,paddingLeft: 4,paddingRight: 4)
        dividerView.setHeight(0.5)
    }
    
    func configure() {
    }
}
