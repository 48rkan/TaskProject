//
//  RegisterViewModel.swift
//  TaskProject
//
//  Created by Erkan Emir on 10.08.23.
//

import UIKit

class RegisterViewModel {
    var email: String?
    var password: String?
    var fullName: String?
    
    var selectedImage: UIImage?
    
    var formIsValid: Bool {
        email?.isEmpty    == false &&
        password?.isEmpty == false &&
        fullName?.isEmpty == false 
    }
    
    var configBackgroundColor: UIColor { formIsValid ? .darkGray : .white }

}
