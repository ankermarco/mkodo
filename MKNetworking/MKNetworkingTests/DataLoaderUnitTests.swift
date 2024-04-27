//
//  DataLoaderUnitTests.swift
//  MKNetworkingTests
//
//  Created by Ke Ma on 24/04/2024.
//

import XCTest
import MKNetworking

final class DataLoaderUnitTests: XCTestCase {
    func test_loadTweets_returnsAllTweetsFromLocalJSON() async {
        let sut = LocalLotteryLoader()
        let lotteries = await sut.loadLotteries()
        
        XCTAssertEqual(lotteries.count, 3)
    }

}
