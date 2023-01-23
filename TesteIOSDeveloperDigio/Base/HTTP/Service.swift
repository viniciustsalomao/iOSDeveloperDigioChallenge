//
//  Service.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 19/01/23.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

enum HTTPStatusCode: Int {
    case okRequest = 200
    case badRequest = 400
    case unauthorized = 401
    case internalServerError = 500
}

class Service <T: Decodable> {

    let session = URLSession.shared

    func getData(url: URL, completion: @escaping (Result<T, CustomError>) -> Void) {
        let request = createRequest(method: HTTPMethod.GET.rawValue, url: url)

        let task = session.dataTask(with: request) { data, response, error in
            do {
                let httpResponse = response as? HTTPURLResponse
                if httpResponse?.statusCode != HTTPStatusCode.okRequest.rawValue {
                    print(httpResponse!.statusCode)
                    completion(.failure(CustomError.httpError(httpResponse?.statusCode ?? 0)))
                } else {
                    if let data = data {
                        let decoder = JSONDecoder()
                        let jsonData = try decoder.decode(T.self, from: data)

                        completion(.success(jsonData))
                    } else if let error = error {
                        completion(.failure(CustomError.responseError(error.localizedDescription)))
                    }
                }
            } catch {
                completion(.failure(CustomError.genericError))
            }
        }
        task.resume()
    }

    private func createRequest(method: String, url: URL, body: [String: String] = [:]) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if !body.isEmpty {
            let bodyData = try? JSONSerialization.data(
                withJSONObject: body,
                options: []
            )
            request.httpBody = bodyData
        }

        return request
    }

}
