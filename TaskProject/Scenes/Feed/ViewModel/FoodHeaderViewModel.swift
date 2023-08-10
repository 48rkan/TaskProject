//
//  FoodHeaderViewModel.swift
//  TaskProject
//
//  Created by Erkan Emir on 10.08.23.
//

import UIKit

class FoodHeaderViewModel {
    
    //MARK: - Properties
    var imageData: Data?
    
    //MARK: - Lifecycle
    init() {
        setImage()
    }
    
    var fullName: String {
        return UserDefaults.standard.string(forKey: "USER_FULLNAME") ?? ""
    }
    
    func setImage() {
        guard let url = UserDefaults.standard.url(forKey: "USER_IMAGE")  else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        
        self.imageData = data
    }
}
