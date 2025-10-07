//
//  Stock.swift
//  stockProject
//
//  Created by vision on 10/6/25.
//

import Foundation

struct Stock: Codable {
    let symbol: String
    let name: String
    let price: Double
    let change: Double
    let chagePercentage: Double 
}
