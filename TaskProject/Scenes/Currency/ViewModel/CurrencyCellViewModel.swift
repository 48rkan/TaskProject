//
//  CurrencyCellViewModel.swift
//  TaskProject
//
//  Created by Erkan Emir on 11.08.23.
//

import Foundation

class CurrencyCellViewModel {
    var item: Country
    
    var image   : String { item.image    }
    var name    : String { item.name     }
    var purchase: String { item.purchase }
    var sell    : String { item.sell     }

    
    init(item: Country) {
        self.item = item
    }
    
}
