//  Convertasion+ ext.swift
//  TaskProject
//  Created by Erkan Emir on 17.08.23.

import Foundation

extension String {
    var double: Double { Double(self) ?? 0 }
}

extension Double {
    var string: String { String(self) }
}
