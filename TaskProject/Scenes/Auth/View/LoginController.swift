//
//  LoginController.swift
//  TaskProject
//
//  Created by Erkan Emir on 10.08.23.
//

import UIKit

protocol LoginControllerDelegate: AnyObject {
    func didFinishAuth()
}

class LoginController: UIViewController {
    
    //MARK: - Properties
    var viewModel = LoginViewModel()
    
    weak var delegate: LoginControllerDelegate?
    
    private let emailContainerView    = CustomContainerView(image: Assets.mail.image(),
                                                            placeholder: "Email")
    
    private let passwordContainerView = CustomContainerView(image: Assets.lock.image(),
                                                            placeholder: "Password",
                                                            secure: true)
    
    private lazy var logInButton: CustomButton = {
        let b = CustomButton(backgroundColor: .white ,title: "Log in",
                             titleColor: .lightGray, size: 20,
                             cornerRadius: 5)
        b.addTarget(self, action: #selector(tappedLogInButton), for: .touchUpInside)
        b.isEnabled = false

        return b
    }()
    
    private lazy var dontHaveAccountButton: UIButton = {
        let b = UIButton()
        b.setButtonConfiguration(firstText: "Don't have an account?",firstTextColor: .white, secondText: " Sign up",secondTextColor: .white)
        b.addTarget(self, action: #selector(tappedGoRegister), for: .touchUpInside)
        return b
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configDelegates()
    }
    
    //MARK: - Actions
    @objc func tappedGoRegister() {
        let controller = RegisterController()
        navigationController?.show(controller, sender: nil)
    }
    
    @objc func tappedLogInButton() {
        guard let email    = emailContainerView.textField.text    else { return }
        guard let password = passwordContainerView.textField.text else { return }
        
        guard Keychain.shared.get("USER_EMAIL") == email && Keychain.shared.get("USER_PASSWORD") == password else {
            showMessage(withTitle: "Wrong Email or Password", message: "")
            return
        }
        
        UserDefaults.standard.setValue(true, forKey: "USER_IS_LOGIN")
        delegate?.didFinishAuth()
        dismiss(animated: true)
    }
}

//MARK: - Helpers
extension LoginController {
    
    func configureUI() {
        navigationController?.navigationBar.isHidden = true

        view.backgroundColor = .systemGreen

        let stack = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView,logInButton])
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 80,paddingLeft: 8,paddingRight: 8)
        stack.setHeight(160)
        stack.axis         = .vertical
        stack.distribution = .fillEqually
        stack.spacing      = 16
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left: view.leftAnchor,
                                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                     right: view.rightAnchor,
                                     paddingLeft: 4,paddingBottom: 4,paddingRight: 4)
    }
    
    func configDelegates() {
        emailContainerView.delegate    = self
        passwordContainerView.delegate = self
    }
}

extension LoginController: CustomContainerViewDelegate {
    
    func didChangeTextField(sender: UITextField, text: String) {
        switch sender {
        case emailContainerView.textField:
            viewModel.email = text
        case passwordContainerView.textField:
            viewModel.password = text
        case _:
            break
        }
        
        logInButton.backgroundColor = viewModel.configBackgroundColor
        updateForm()
    }
    
    func updateForm() {
        if viewModel.formIsValid {
            logInButton.isEnabled = true
        } else {
            logInButton.isEnabled = false
        }
    }
}
