//
//  Extensions.swift
//  InstagramFirestoreTutorial
//
//  Created by Stephen Dowless on 6/19/20.
//  Copyright © 2020 Stephan Dowless. All rights reserved.
//

import UIKit
import JGProgressHUD

extension UIViewController {
    static let hud = JGProgressHUD(style: .dark)

    func showLoader(_ show: Bool) {
        view.endEditing(true)

        if show {
            UIViewController.hud.show(in: view)
        } else {
            UIViewController.hud.dismiss()
        }
    }
    
    func showMessage(withTitle title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showMessageActionSheet(title: String,completion: @escaping ()->()) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: title,
                                      style: .default,
                                      handler: { _ in
            completion()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: .default,
                                      handler: nil))
        
        present(alert, animated: true, completion: nil)

    }
}


extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func equalWidth(percent: CGFloat ,mainWidth:NSLayoutDimension) {
        widthAnchor.constraint(equalTo: mainWidth, multiplier: percent).isActive = true
    }
    
    func equalHeight(percent: CGFloat ,mainHeight:NSLayoutDimension) {
        heightAnchor.constraint(equalTo: mainHeight, multiplier: percent).isActive = true
    }
    
    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
    }
    
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setHeight(_ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setWidth(_ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        guard let view = superview else { return }
        anchor(top: view.topAnchor, left: view.leftAnchor,
               bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    func addConstraintsToFillView(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        anchor(top: view.topAnchor, left: view.leftAnchor,
               bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}

// xususi reng vermek

//extension UIColor {
//    convenience init(hexString: String, alpha: CGFloat = 1.0) {
//        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//        let scanner = Scanner(string: hexString)
//        if (hexString.hasPrefix("#")) {
//            scanner.scanLocation = 1
//        }
//        var color: UInt32 = 0
//        scanner.scanHexInt32(&color)
//        let mask = 0x000000FF
//        let r = Int(color >> 16) & mask
//        let g = Int(color >> 8) & mask
//        let b = Int(color) & mask
//        let red   = CGFloat(r) / 255.0
//        let green = CGFloat(g) / 255.0
//        let blue  = CGFloat(b) / 255.0
//        self.init(red:red, green:green, blue:blue, alpha:alpha)
//    }
//    func toHexString() -> String {
//        var r:CGFloat = 0
//        var g:CGFloat = 0
//        var b:CGFloat = 0
//        var a:CGFloat = 0
//        getRed(&r, green: &g, blue: &b, alpha: &a)
//        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
//        return String(format:"#%06x", rgb)
//    }
//}

// labelin hecmine gore hundurluk vermek

extension CVarArg {
    
    func dynamicHeightCalculator(text: String,width: CGFloat) -> CGFloat {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = text
        label.lineBreakMode = .byWordWrapping
        label.setWidth(width)
        
        return label.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
    }
    
    func dynamicWidthCalculator(text: String,height: CGFloat) -> CGFloat {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = text
        label.lineBreakMode = .byWordWrapping
        label.setHeight(height)
//        label.setWidth(width)
        
        return label.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).width
    }
}

// yalniz bir hisseye corner radius vermek

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

// string'in istediyimiz elementini silmek ve ona catmaq
extension String {
    mutating func  removeCharacter(_ index: Int) -> Self {
        let index = self.index(self.startIndex, offsetBy: index)
        self.remove(at: index)
        return self
    }
    
    subscript(i: Int) -> Self {
        return  i < self.count ? String(self[index(startIndex, offsetBy: i)]) : ""
    }
}
