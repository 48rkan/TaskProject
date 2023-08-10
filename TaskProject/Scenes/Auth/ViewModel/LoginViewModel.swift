//
//  LoginViewModel.swift
//  TaskProject
//
//  Created by Erkan Emir on 10.08.23.
//

import UIKit

protocol UpdateFormProtocol {
    func updateForm()
}

protocol AuthProtocol {
    var formIsValid: Bool { get }
    var configBackgroundColor: UIColor { get }
}

struct LoginViewModel: AuthProtocol {
    var email   : String?
    var password: String?
    
    var formIsValid          : Bool    { email?.isEmpty == false && password?.isEmpty == false }
    var configBackgroundColor: UIColor { formIsValid ? .darkGray  : .white }
}
