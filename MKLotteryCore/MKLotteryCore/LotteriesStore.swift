//
//  LotteriesStore.swift
//  MKLotteryCore
//
//  Created by Ke Ma on 27/04/2024.
//
import Foundation


/// This is the composational layer to handle logic from both
/// DataLoader
/// and LotteryStore
public struct LotteriesStore: DataLoader {
    private let dataLoader: DataLoader
    private let cache: LotteryStore
    
    public init(
        dataLoader: DataLoader,
        cache: LotteryStore
    ) {
        self.dataLoader = dataLoader
        self.cache = cache
    }
    
    public func loadLotteries() async -> [Lottery] {
        guard let cached = try? await cache.load(),
                !cached.isEmpty else {
            let remoteData = await dataLoader.loadLotteries()
            do {
               try await cache.save(lotteries: remoteData)
            } catch {
                // Handle error
            }
            return remoteData
        }
        
        return cached
    }
}
