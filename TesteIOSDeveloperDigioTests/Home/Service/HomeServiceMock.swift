//
//  HomeServiceMock.swift
//  TesteIOSDeveloperDigioTests
//
//  Created by Vinícius Tinajero Salomão on 23/01/23.
//

import Foundation
@testable import TesteIOSDeveloperDigio

class HomeServiceMock: HomeService {

    override init() {
        super.init()
        super.service = ServiceMock()
    }

    override func getProducts(completion: @escaping (Result<HomeResponse, Error>) -> Void) {
        if let url = Bundle(for: HomeServiceMock.self).url(forResource: ResourcesHelper.responseJsonName, withExtension: "json") {
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

}
