//
//  LotteriesStoreUnitTests.swift
//  MKLotteryCoreTests
//
//  Created by Ke Ma on 27/04/2024.
//

import MKLotteryCore
import XCTest

final class LotteriesStoreUnitTests: XCTestCase {
    
    func test_loadLotteries_fromRemoteWhenCacheIsEmpty() async {
        // Given
        let (dataLoaderSpy, _, sut) = makeSUT()
        dataLoaderSpy.completesSuccessfully()
        
        // When
        let lotteries = await sut.loadLotteries()
        
        // Then
        XCTAssertEqual(lotteries, DataLoaderSpy.givenLottories)
    }
    
    func test_loadLotteries_fromCacheWhenCacheIsNotEmpty() async {
        // Given
        let (dataLoaderSpy, lotteryStoreSpy, sut) = makeSUT()
        dataLoaderSpy.completesSuccessfully()
        lotteryStoreSpy.lotteriesInCache = DataLoaderSpy.givenLottories
        
        // When
        let lotteries = await sut.loadLotteries()
        
        // Then
        XCTAssertEqual(lotteries, DataLoaderSpy.givenLottories)
    }
    
    func test_loadLotteries_saveIntoCacheWhenCacheIsEmpty() async {
        // Given
        let (dataLoaderSpy, lotteryStoreSpy, sut) = makeSUT()
        dataLoaderSpy.completesSuccessfully()
        lotteryStoreSpy.lotteriesInCache = []
        
        // When
        let lotteries = await sut.loadLotteries()
        
        // Then
        XCTAssertEqual(lotteries, DataLoaderSpy.givenLottories)
        XCTAssertEqual(lotteryStoreSpy.lotteriesInCache, DataLoaderSpy.givenLottories)
        XCTAssertEqual(lotteryStoreSpy.functionsCalled, ["load()", "save(lotteries:)"])
    }

    private func makeSUT() -> (DataLoaderSpy, LotteryStoreSpy, LotteriesStore) {
        let dataLoaderSpy = DataLoaderSpy()
        let lotteryStoreSpy = LotteryStoreSpy()
        let sut = LotteriesStore(dataLoader: dataLoaderSpy, cache: lotteryStoreSpy)
        
        return (dataLoaderSpy, lotteryStoreSpy, sut)
    }
    
    private class DataLoaderSpy: DataLoader {
        static let givenLottories = [
            Lottery(
                id: "testId",
                drawAt: Date(timeIntervalSince1970: 1),
                winningNumbers: ["10", "20", "35", "44"],
                bonusBallNumber: "2",
                topPrize: 40000000
            )
        ]
        private var lotteries = [Lottery]()
        func loadLotteries() async -> [MKLotteryCore.Lottery] {
            lotteries
        }
        
        func completesSuccessfully() {
            lotteries = Self.givenLottories
        }
    }
    
    private class LotteryStoreSpy: LotteryStore {
        var lotteriesInCache = [Lottery]()
        var functionsCalled = [String]()
        func load() async throws -> [MKLotteryCore.Lottery] {
            functionsCalled.append(#function)
            return lotteriesInCache
        }
        
        func save(lotteries: [MKLotteryCore.Lottery]) async throws {
            lotteriesInCache = lotteries
            functionsCalled.append(#function)
        }
    }
}
