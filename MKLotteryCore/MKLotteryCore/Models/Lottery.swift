//
//  Lottery.swift
//  MKLotteryCore
//
//  Created by Ke Ma on 24/04/2024.
//

import Foundation

public struct Lottery: Identifiable, Equatable, Codable {
    public init(
        id: String,
        drawAt: Date,
        winningNumbers: [String],
        bonusBallNumber: String,
        topPrize: Int
    ) {
        self.id = id
        self.drawAt = drawAt
        self.winningNumbers = winningNumbers
        self.bonusBallNumber = bonusBallNumber
        self.topPrize = topPrize
    }
    
    public let id: String
    public let drawAt: Date
    public let winningNumbers: [String]
    public let bonusBallNumber: String
    public let topPrize: Int
}
