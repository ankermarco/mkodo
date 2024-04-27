//
//  FileStorage.swift
//  MKStorage
//
//  Created by Ke Ma on 27/04/2024.
//


import Foundation
import MKLotteryCore
import SwiftUI

public struct FileStorage: LotteryStore {
    private let storeURL: URL
    
    public init(storeURL: URL) {
        self.storeURL = storeURL
    }
    
    public static func fileURL() -> URL? {
        try? FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("MKStorage.data")
    }
    
    public func load() async throws -> [MKLotteryCore.Lottery] {
        let task = Task<[Lottery], Error> {
            guard let data = try? Data(contentsOf: storeURL) else {
                return []
            }
            return try JSONDecoder().decode([Lottery].self, from: data)
        }
        
        return try await task.value
    }
    
    public func save(lotteries: [MKLotteryCore.Lottery]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(lotteries)
            try data.write(to: storeURL)
        }
        _ = try await task.value
    }
}
