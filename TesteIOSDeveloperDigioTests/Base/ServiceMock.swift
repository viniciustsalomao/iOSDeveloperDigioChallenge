//
//  ServiceMock.swift
//  TesteIOSDeveloperDigioTests
//
//  Created by Vinícius Tinajero Salomão on 23/01/23.
//

import Foundation
@testable import TesteIOSDeveloperDigio

class ServiceMock <T: Decodable>: Service<T> {

    override func getData(url: URL, completion: @escaping (Result<T, CustomError>) -> Void) {
        loadDataFromJson(url: url) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let errorMessage):
                completion(.failure(CustomError.customError(errorMessage.localizedDescription)))
            }
        }
    }

    private func loadDataFromJson(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
       do {
           let data = try Data(contentsOf: url)
           let decoder = JSONDecoder()
           let jsonData = try decoder.decode(T.self, from: data)

           completion(.success(jsonData))
       } catch {
           completion(.failure(CustomError.customError("failure")))
       }
    }
}
