//
//  LotteryCache.swift
//  MKLotteryCore
//
//  Created by Ke Ma on 27/04/2024.
//

import Foundation

/// This Abstract layer define the main app's dependency
/// Use protocol to decouple the main app with data persistent layer and make testing easier
public protocol LotteryStore {
    func load() async throws -> [Lottery]
    func save(lotteries: [Lottery]) async throws
}
