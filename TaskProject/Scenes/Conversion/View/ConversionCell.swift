//
//  ConversionCell.swift
//  TaskProject
//
//  Created by Erkan Emir on 11.08.23.

import UIKit

class ConversionCell: UITableViewCell {
    
    //MARK: - Properties
    var viewModel: ConversionCellViewModel? {
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
    
    private let currencyDescriptiptionLabel: CustomLabel = {
        let l = CustomLabel(text: "Usd dollar",
                            textColor: .lightGray,
                            systemfont: UIFont.systemFont(ofSize: 14),
                            alignment: .left,numberOfLines: 0)
        return l
    }()
    
    private let amountLabel: CustomLabel = {
        let l = CustomLabel(text: "1",
                            textColor: .black,
                            systemfont: UIFont.systemFont(ofSize: 20),
                            alignment: .left,numberOfLines: 0)
        return l
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been") }
    
    func configureUI() {
        contentView.addSubview(iconImageView)
        iconImageView.centerY(inView: self,leftAnchor: leftAnchor,paddingLeft: 16)
        iconImageView.setDimensions(height: 24, width: 24)
        iconImageView.layer.cornerRadius = 4
        
        let stack = UIStackView(arrangedSubviews: [currencyNameLabel,currencyDescriptiptionLabel])
        contentView.addSubview(stack)
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 0
        stack.centerY(inView: iconImageView,leftAnchor: iconImageView.rightAnchor,paddingLeft: 16)
        
        contentView.addSubview(amountLabel)
        amountLabel.centerY(inView: iconImageView)
        amountLabel.anchor(right: rightAnchor,paddingRight: 16)
    }
    
    func configure() {
        iconImageView.setImage(stringURL: viewModel?.item.image ?? "")
        amountLabel.text = viewModel?.item.amount ?? ""
        currencyNameLabel.text = viewModel?.item.name
        currencyDescriptiptionLabel.text = viewModel?.item.description 
    }
}
