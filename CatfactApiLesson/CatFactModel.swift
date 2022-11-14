//
//  CatFactModel.swift
//  CatfactApiLesson
//
//  Created by Nikolas Omelianov on 14.11.2022.
//

import Foundation

struct CatFact: Decodable {
    let fact: String
    let length: Int
}
