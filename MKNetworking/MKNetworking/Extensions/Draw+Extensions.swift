//
//  Draw+Extensions.swift
//  MKNetworking
//
//  Created by Ke Ma on 24/04/2024.
//

import Foundation
import MKLotteryCore

extension Draw {
    public static var draws: [Lottery] {
        items.map {
            $0.lottery
        }
    }

    // Mark: - Helpers
    private static var items: [DrawItem] {
        Self.parse(jsonFile: "draws")?.draws.map {
            DrawItem(id: $0.id, drawDate: $0.drawDate, number1: $0.number1, number2: $0.number2, number3: $0.number3, number4: $0.number4, number5: $0.number5, number6: $0.number6, bonusBall: $0.bonusBall, topPrize: $0.topPrize)
        } ?? []
    }
}
