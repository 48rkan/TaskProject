//
//  HeaderView.swift
//  TaskProject
//
//  Created by Erkan Emir on 11.08.23.
//

import UIKit

class HeaderView: UIView {
    //MARK: - Properties
    private lazy var title1: CustomLabel = {
        let l = CustomLabel(text: "Konvertasiya",
                            textColor: .black,
                            systemfont: UIFont.boldSystemFont(ofSize: 24),
                            alignment: .left,numberOfLines: 0)
        return l
    }()
    
    private lazy var title2: CustomLabel = {
        let l = CustomLabel(text: "VALYUTA MƏZƏNNƏSİ",
                            textColor: .lightGray,
                            systemfont: UIFont.systemFont(ofSize: 14),
                            alignment: .left,numberOfLines: 0)
        return l
    }()
    
    private lazy var title3: CustomLabel = {
        let l = CustomLabel(text: "MƏBLƏĞ",
                            textColor: .lightGray,
                            systemfont: UIFont.systemFont(ofSize: 14),
                            alignment: .left,numberOfLines: 0)
        return l
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been") }
    
    //MARK: - Helper
    func configureUI() {
        addSubview(title1)
        title1.anchor(top: topAnchor,left: leftAnchor,paddingTop: 0,paddingLeft: 4)
        
        addSubview(title2)
        title2.anchor(top: title1.bottomAnchor,left: leftAnchor,paddingTop: 12,paddingLeft: 8)
        
        addSubview(title3)
        title3.anchor(top: title1.bottomAnchor,right: rightAnchor,paddingTop: 12,paddingRight: 8)

    }
}
