//
//  FeedViewModel.swift
//  TaskProject
//
//  Created by Erkan Emir on 10.08.23.
//

import Foundation

class FeedCellViewModel {
    //MARK: - Properties
    var items: MenuFilterOptions
    
    //MARK: - Lifecycle
    init(items: MenuFilterOptions) {
        self.items = items
    }
}
