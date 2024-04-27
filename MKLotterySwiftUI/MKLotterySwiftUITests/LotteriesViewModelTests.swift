//
//  LotteriesViewModelTests.swift
//  MKLotterySwiftUITests
//
//  Created by Ke Ma on 26/04/2024.
//

import MKLotteryCore
@testable import MKLotterySwiftUI
import XCTest

final class LotteriesViewModelTests: XCTestCase {
    private var sut: LotteriesViewModel!
    private var dataLoaderSpy: DataLoaderSpy!
    
    override func setUp() {
        super.setUp()
        
        dataLoaderSpy = DataLoaderSpy()
        sut = LotteriesViewModel(dataLoader: dataLoaderSpy)
    }
    
    override func tearDown() {
        sut = nil
        dataLoaderSpy = nil
        
        super.tearDown()
    }
    
    func test_loadLotteries_fetchesLotteries_whenDataLoaderSpyCompletedSuccessfully() async {
        // Given
        dataLoaderSpy.completesSuccessfully()
    
        // When
        await sut.loadLotteries()
        
        // Then
        XCTAssertEqual(sut.lotteries, DataLoaderSpy.givenLottories)
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
}
