//
//  DrawItem.swift
//  MKNetworking
//
//  Created by Ke Ma on 24/04/2024.
//

import Foundation

public struct DrawItem: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case drawDate
        case number1
        case number2
        case number3
        case number4
        case number5
        case number6
        case bonusBall = "bonus-ball"
        case topPrize
    }
    
    public init(
        id: String,
        drawDate: String,
        number1: String,
        number2: String,
        number3: String,
        number4: String,
        number5: String,
        number6: String,
        bonusBall: String,
        topPrize: Int
    ) {
        self.id = id
        self.drawDate = drawDate
        self.number1 = number1
        self.number2 = number2
        self.number3 = number3
        self.number4 = number4
        self.number5 = number5
        self.number6 = number6
        self.bonusBall = bonusBall
        self.topPrize = topPrize
    }
    
    let id: String
    let drawDate: String
    let number1: String
    let number2: String
    let number3: String
    let number4: String
    let number5: String
    let number6: String
    let bonusBall: String
    let topPrize: Int
}
