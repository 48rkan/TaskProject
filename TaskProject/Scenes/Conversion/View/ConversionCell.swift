//
//  ConversionCell.swift
//  TaskProject
//  Created by Erkan Emir on 11.08.23.

import UIKit

protocol ConversionCellDelegate: AnyObject {
    func editingChanged(coffient: Double)
}

class ConversionCell: UITableViewCell {
    
    //MARK: - Properties
    weak var delegate: ConversionCellDelegate?
    
    var viewModel: ConversionCellViewModel? {
        didSet { configure() }
    }
    
    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode   = .scaleToFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let currencyNameLabel: CustomLabel = {
        let l = CustomLabel(text: "",
                            textColor: .black,
                            systemfont: UIFont.boldSystemFont(ofSize: 16),
                            alignment: .left,numberOfLines: 0)
        return l
    }()
    
    private let currencyDescriptiptionLabel: CustomLabel = {
        let l = CustomLabel(text: "",
                            textColor: .lightGray,
                            systemfont: UIFont.systemFont(ofSize: 14),
                            alignment: .left,numberOfLines: 0)
        return l
    }()
    
    private lazy var amountTextField: CustomTextField = {
        let tf = CustomTextField(placeholder: "", textColor: .black)
        tf.text = "1"
        tf.addTarget(self, action: #selector(changedAmount), for: .editingChanged)
        return tf
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been") }
    
    //MARK: - Actions
    @objc func changedAmount() {
        guard let amount = amountTextField.text else { return }

        delegate?.editingChanged(coffient: amount.double)
    }
    
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
        
        contentView.addSubview(amountTextField)
        amountTextField.centerY(inView: iconImageView)
        amountTextField.anchor(right: rightAnchor,paddingRight: 16)
    }
    
    func configure() {
        guard let viewModel else { return }

        iconImageView.setImage(stringURL: viewModel.item.image )
        currencyNameLabel.text = viewModel.item.name
        currencyDescriptiptionLabel.text = viewModel.item.description
        
        guard let total = viewModel.item.total else { return }
        amountTextField.text = total
    }
}
