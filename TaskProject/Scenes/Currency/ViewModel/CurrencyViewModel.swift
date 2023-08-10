//
//  CurrencyViewModel.swift
//  TaskProject
//
//  Created by Erkan Emir on 11.08.23.

import Foundation

class CurrencyViewModel {
    var items =  [Country]()
    var successCallBack: (()->())?
    
    init() {
        fetchData()
    }

    func fetchData() {
        guard let url = Bundle.main.url(forResource: "LocalJson", withExtension: "json") else { return }
    
        do {
            let data = try Data(contentsOf: url)
            items = try JSONDecoder().decode([Country].self, from: data)
            
            successCallBack?()
        } catch {
            print("DEBUG:\(error.localizedDescription)")
        }
    }
}
