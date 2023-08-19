//
//  Conversion.swift
//  TaskProject
//
//  Created by Erkan Emir on 11.08.23.

import Foundation

// MARK: - StructElement
struct Conversion: Codable {
    var amount, name: String
    let image       : String
    let description : String
    var total       : String?
}

