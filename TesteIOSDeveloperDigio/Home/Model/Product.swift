//
//  Product.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 19/01/23.
//

import Foundation

struct Product: Decodable {
    let name: String
    let imageURL: String
    let description: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ProductCodingKeys.self)
        if let name = try container.decodeIfPresent(String.self, forKey: .name) {
            self.name = name
        } else {
            self.name = try container.decode(String.self, forKey: .title)
        }
        if let imageURL = try container.decodeIfPresent(String.self, forKey: .imageURL) {
            self.imageURL = imageURL
        } else {
            self.imageURL = try container.decode(String.self, forKey: .bannerURL)
        }
        self.description = try container.decode(String.self, forKey: .description)
    }
    
    enum ProductCodingKeys: String, CodingKey, CaseIterable {
        case name, title
        case imageURL, bannerURL
        case description
    }
}
