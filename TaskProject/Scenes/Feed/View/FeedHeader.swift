//
//  FeedHeader.swift
//  TaskProject
//
//  Created by Erkan Emir on 10.08.23.
//

import UIKit

class FeedHeader: UICollectionReusableView {
    
    //MARK: - Properties
    var viewModel = FoodHeaderViewModel() {
        didSet { configure() }
    }
    
    private lazy var infoLabel: CustomLabel = {
        let l = CustomLabel(text: " Xoş gəlmişsiniz, \n \(viewModel.fullName)",
                            textColor: .black,
                            systemfont: UIFont.boldSystemFont(ofSize: 24),
                            alignment: .left,numberOfLines: 0)
        return l
    }()
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.clipsToBounds = true
        return iv
    }()
    
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .lightGray
        configureUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been") }
    
    func configureUI() {
        addSubview(infoLabel)
        infoLabel.anchor(top: topAnchor,left: leftAnchor,
                         paddingTop: 4,paddingLeft: 4)
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor,right: rightAnchor,paddingTop: 4,paddingRight: 4)
        profileImageView.setDimensions(height: 60, width: 60)
        profileImageView.layer.cornerRadius = 30
    }
    
    func configure() {
        guard let data = viewModel.imageData else { return }
        infoLabel.text = "Xoş gəlmişsiniz, \n \(viewModel.fullName)"
        profileImageView.image = UIImage(data: data)
    }
}
