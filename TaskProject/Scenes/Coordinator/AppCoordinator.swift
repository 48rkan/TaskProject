//
//  AppCoordinator.swift
//  TaskProject
//
//  Created by Erkan Emir on 11.08.23.

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(window: UIWindow) {
        window.rootViewController = UINavigationController(rootViewController: FeedController())
        window.makeKeyAndVisible()
    }
    
    func showRegister() {
        let controller = RegisterController()
        navigationController.show(controller, sender: nil)
    }
    
    func backLogin() {
        navigationController.popViewController(animated: true)
    }
    
    func showLogin(delegate: LoginControllerDelegate?) {
        let controller      = LoginController()
        controller.delegate = delegate
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        
        navigationController.present(nav, animated: false)
    }
    
    func showCurrency() {
        let vc = CurrencyController()
         if #available(iOS 15.0, *) {
             if let sheet = vc.sheetPresentationController {
                 sheet.detents = [.medium()]
                 sheet.preferredCornerRadius = 20
             }
         }
        navigationController.present(vc, animated: true, completion: nil)
    }
    
    func showConversion() {
        let controller = ConversionController()
        navigationController.present(controller, animated: true)
    }
}
