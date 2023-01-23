//
//  HomeResponse.swift
//  TesteIOSDeveloperDigio
//
//  Created by Vinícius Tinajero Salomão on 19/01/23.
//

import Foundation

struct HomeResponse: Decodable {
    let spotlight: [Product]
    let products: [Product]
    let cash: Product
}
