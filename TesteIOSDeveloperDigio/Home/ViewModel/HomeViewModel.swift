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
    
//    var spotLight: [Spotlight]?
//    var products: [Product]?
//    var cash: Cash?
    
    var spotLight: [Product]?
    var products: [Product]?
    var cash: Product?
    
    var bindSuccess: (() -> ())?
    var bindFailure: (() -> ())?
    
    let service: HomeService

    init(service: HomeService) {
        self.service = service
    }
    
    func getProducts() {
        service.getProducts(completion: { result in
            if let result = result {
                self.spotLight = result.spotlight
                self.products = result.products
                self.cash = result.cash
                
                self.bindSuccess?()
            } else {
                self.bindFailure?()
            }
        })
    }
    
    func getProductDetail(of productIndex: Int) -> Product {
        return (products?[productIndex])!
    }

}
