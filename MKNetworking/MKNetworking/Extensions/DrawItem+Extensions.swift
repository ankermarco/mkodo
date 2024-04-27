//
//  DrawItem+Extensions.swift
//  MKNetworking
//
//  Created by Ke Ma on 24/04/2024.
//

import Foundation
import MKLotteryCore

public extension DrawItem {
    var lottery: Lottery {
        .init(
            id: id,
            drawAt: drawDate.dateFromISOString() ?? Date(),
            winningNumbers: [number1, number2, number3, number4, number5, number6],
            bonusBallNumber: bonusBall,
            topPrize: topPrize
        )
    }
}
