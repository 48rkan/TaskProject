//
//  FeedViewModel.swift
//  TaskProject
//
//  Created by Erkan Emir on 10.08.23.
//

import Foundation

class FeedCellViewModel {
    //MARK: - Properties
    var items: (String,String,String)
    
    //MARK: - Lifecycle
    init(items: (String, String,String)) {
        self.items = items
    }
}
