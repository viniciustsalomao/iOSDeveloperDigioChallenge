//
//  Environments.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 18/01/23.
//

import Foundation

enum Environment {
    case products
    
    private var basePath: String { return  "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox" }
    
    var url: URL? {
        switch self {
        case .products:
            return URL(string: "\(basePath)/products")
        }
    }
}
