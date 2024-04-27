//
//  DataLoader.swift
//  MKLotteryCore
//
//  Created by Ke Ma on 24/04/2024.
//

import Foundation

/// This Abstract layer define the main app's dependency
/// Use protocol to decouple the main app with Network requests and make testing easier
public protocol DataLoader {
    func loadLotteries() async -> [Lottery]
}
