//
//  SDWebImage+ext.swift
//  TaskProject
//
//  Created by Erkan Emir on 11.08.23.

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(stringURL: String) {
        self.sd_setImage(with: URL(string: stringURL))
    }
}
