//
//  FeedFooter.swift
//  TaskProject
//
//  Created by Erkan Emir on 10.08.23.
//

import UIKit

protocol FeedFooterDelegate: AnyObject {
    func tappedFooter(_ footer: FeedFooter)
}

class FeedFooter: UICollectionReusableView {
    
    //MARK: - Properties
    weak var delegate: FeedFooterDelegate?
    
    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "exit")
        iv.backgroundColor = .red
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var titleLabel: CustomLabel = {
        let l = CustomLabel(text: "Çıxış",
                            textColor: .red,
                            systemfont: UIFont.boldSystemFont(ofSize: 16),
                            alignment: .left)
        return l
    }()
    
    private let markButton: UIButton = {
        let b = UIButton()
        b.setImage(UIImage(named: "down_arrow_24pt"), for: .normal)
        return b
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureGesture()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been") }
    
    //MARK: - Actions
    @objc func tappedFooter() {
        delegate?.tappedFooter(self)
    }
    
    //MARK: - Helper
    func configureUI() {
        
        addSubview(iconImageView)

        iconImageView.centerY(inView: self,leftAnchor: leftAnchor,paddingLeft: 8)
        iconImageView.setDimensions(height: 36, width: 44)
        iconImageView.layer.cornerRadius = 12
        
        addSubview(titleLabel)
        titleLabel.centerY(inView: iconImageView,leftAnchor: iconImageView.rightAnchor,paddingLeft: 20)
        
        addSubview(markButton)
        markButton.centerY(inView: iconImageView)
        markButton.anchor(right: rightAnchor,paddingRight: 12)
    }
    
    func configureGesture() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedFooter)))
        self.isUserInteractionEnabled = true
    }
}
