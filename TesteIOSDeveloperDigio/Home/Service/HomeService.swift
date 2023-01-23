//
//  HomeService.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 18/01/23.
//

import Foundation

class HomeService {
    var service: Service<HomeResponse>
    
    init() {
        service = Service()
    }
    
    func getProducts(completion: @escaping (Result<HomeResponse, Error>) -> Void) {
        guard let url = Environment.products.url else { return }
        service.getData(url: url, completion: { result  in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            case .success(let response):
                completion(.success(response))
            }
        })
    }
}
