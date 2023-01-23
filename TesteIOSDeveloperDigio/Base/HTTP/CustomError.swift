//
//  CustomError.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 19/01/23.
//

import Foundation

enum CustomError: Error, Equatable {
    case customError(String)
    case genericError
    case httpError(Int)
    case responseError(String)
}

extension CustomError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .customError(let error):
            return NSLocalizedString(
                error,
                comment: ""
            )
        case .genericError:
            return NSLocalizedString(
                "Failure",
                comment: ""
            )
        case .httpError(let statusCode):
            return NSLocalizedString(
                "HTTP Request Failed with status code: \(statusCode)",
                comment: ""
            )
        case .responseError(let error):
            return NSLocalizedString(
                "HTTP Request Failed: \(error)",
                comment: ""
            )
        }
    }
}
