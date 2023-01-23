//
//  HomeViewModel.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 19/01/23.
//

import Foundation
import UIKit

protocol HomeProtocol {
    func getProducts()
}

class HomeViewModel: HomeProtocol {
    
    var spotLight: [Product]?
    var products: [Product]?
    var cash: Product?
    
    var bindSuccess: (() -> ())?
    var bindFailure: ((_ error: Error) -> ())?
    
    let service: HomeService

    init(service: HomeService) {
        self.service = service
    }
    
    func getProducts() {
        service.getProducts(completion: { result in
            switch result {
            case .success(let data):
                self.spotLight = data.spotlight
                self.products = data.products
                self.cash = data.cash
                
                self.bindSuccess?()

            case .failure(let errorMessage):
                self.bindFailure?(errorMessage)
            }
        })
    }

}
