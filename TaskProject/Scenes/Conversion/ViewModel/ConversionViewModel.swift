//
//  ConversionViewModel.swift
//  TaskProject
//
//  Created by Erkan Emir on 11.08.23.
//

import Foundation

import Foundation

class ConversionViewModel {
    var items =  [Conversion]()
    var successCallBack: (()->())?
    
    init() {
        fetchData()
    }

    func fetchData() {
        guard let url = Bundle.main.url(forResource: "ConversionJSON", withExtension: "json") else { return }
    
        do {
            let data = try Data(contentsOf: url)
            items = try JSONDecoder().decode([Conversion].self, from: data)
            print(items)
            successCallBack?()
        } catch {
            print("DEBUG:\(error.localizedDescription)")
        }
    }
    
    func fetchSaleData() {
        guard let url = Bundle.main.url(forResource: "SaleConversionJSON", withExtension: "json") else { return }
    
        do {
            let data = try Data(contentsOf: url)
            items = try JSONDecoder().decode([Conversion].self, from: data)
            print(items)
            successCallBack?()
        } catch {
            print("DEBUG:\(error.localizedDescription)")
        }
    }
}
