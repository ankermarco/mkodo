//
//  LocalLotteryLoader.swift
//  MKNetworking
//
//  Created by Ke Ma on 24/04/2024.
//

import Foundation
import MKLotteryCore

public struct RemoteLotteryLoader: DataLoader {
    public init(){}
    public func loadLotteries() async -> [Lottery] {
        Draw.draws
    }
}
