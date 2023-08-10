//
//  FeedMenuOptions.swift
//  TaskProject
//
//  Created by Erkan Emir on 10.08.23.
//

import Foundation

enum MenuFilterOptions: Int,CaseIterable {
    case currency
    case conversion
    case support
    case none
    
    var title: String {
        switch self {
        case .currency  : return "Valyuta"
        case .conversion: return "Konvertasiya"
        case .support   : return "Dəstək"
        case _          : return ""
        }
    }
    
    var description: String {
        switch self {
        case .currency  : return "Valyuta məzənnələri"
        case .conversion: return "Valyuta konvertoru"
        case .support   : return "Bizimlə əlaqə"
        case _          : return ""

        }
    }
    
    var imageName: String {
        switch self {
        case .currency  : return "currency"
        case .conversion: return "conversion"
        case .support   : return "support"
        case _          : return ""
        }
    }
}
