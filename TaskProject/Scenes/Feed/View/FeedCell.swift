//
//  FeedCell.swift
//  TaskProject
//
//  Created by Erkan Emir on 10.08.23.

import UIKit

class FeedCell: UICollectionViewCell {
    
    //MARK: - Properties
    var viewModel: FeedCellViewModel? {
        didSet {
            configure()
        }
    }
    
    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var titleLabel: CustomLabel = {
        let l = CustomLabel(text: "Valyuta",
                            textColor: .black,
                            systemfont: UIFont.boldSystemFont(ofSize: 16),
                            alignment: .left,numberOfLines: 0)
        return l
    }()
    
    private lazy var descriptionLabel: CustomLabel = {
        let l = CustomLabel(text: "Valyuta məzənnələri",
                            textColor: .lightGray,
                            systemfont: UIFont.systemFont(ofSize: 16),
                            alignment: .left,numberOfLines: 0)
        return l
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been") }
    
    func configureUI() {
        self.layer.borderColor  = UIColor.lightGray.cgColor
        self.layer.borderWidth  = 0.2
        self.layer.cornerRadius = 12
        
        contentView.addSubview(iconImageView)
        iconImageView.anchor(top: contentView.topAnchor,left: contentView.leftAnchor,paddingTop: 8,paddingLeft: 8)
        iconImageView.setDimensions(height: 36, width: 36)
        iconImageView.layer.cornerRadius = 8
        
        contentView.addSubview(titleLabel)
        titleLabel.anchor(top: iconImageView.bottomAnchor,left: contentView.leftAnchor,paddingTop: 12,paddingLeft: 4)
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.anchor(top: titleLabel.bottomAnchor,left: contentView.leftAnchor,paddingTop: 4,paddingLeft: 4)
    }
    
    func configure() {
        guard let viewModel else { return }
        titleLabel.text       = viewModel.items.0
        descriptionLabel.text = viewModel.items.1
        iconImageView.image   = UIImage(named: viewModel.items.2)
    }
}
