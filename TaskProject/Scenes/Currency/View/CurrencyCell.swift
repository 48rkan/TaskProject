//
//  CurrencyCell.swift
//  TaskProject
//
//  Created by Erkan Emir on 11.08.23.
//

import UIKit

class CurrencyCell: UICollectionViewCell {
    
    //MARK: - Properties
    var viewModel: CurrencyCellViewModel? {
        didSet {
            configure()
        }
    }
    
    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let currencyNameLabel: CustomLabel = {
        let l = CustomLabel(text: "USD",
                            textColor: .black,
                            systemfont: UIFont.boldSystemFont(ofSize: 16),
                            alignment: .left,numberOfLines: 0)
        return l
    }()
    
    private let purchasePriceLabel: CustomLabel = {
        let l = CustomLabel(text: "1.6905",
                            textColor: .black,
                            systemfont: UIFont.systemFont(ofSize: 16),
                            alignment: .left,numberOfLines: 0)
        return l
    }()
    
    private let  salePriceLabel: CustomLabel = {
        let l = CustomLabel(text: "1.712",
                            textColor: .black,
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
        contentView.addSubview(iconImageView)
        iconImageView.centerY(inView: self,leftAnchor: leftAnchor,paddingLeft: 8)
        iconImageView.setDimensions(height: 40, width: 40)
        iconImageView.layer.cornerRadius = 20
        
        contentView.addSubview(currencyNameLabel)
        currencyNameLabel.centerY(inView: iconImageView,leftAnchor: iconImageView.rightAnchor,paddingLeft: 8)
        
        contentView.addSubview(purchasePriceLabel)
        purchasePriceLabel.centerY(inView: iconImageView,leftAnchor: currencyNameLabel.rightAnchor,paddingLeft: 72)
        
        contentView.addSubview(salePriceLabel)
        salePriceLabel.centerY(inView: iconImageView)
        salePriceLabel.anchor(right: contentView.rightAnchor,paddingRight: 20)
    }
    
    func configure() {
        guard let viewModel else { return }
        currencyNameLabel.text  = viewModel.name
        purchasePriceLabel.text = viewModel.purchase
        salePriceLabel.text     = viewModel.sell
        iconImageView.setImage(stringURL: viewModel.image)
    }
}
