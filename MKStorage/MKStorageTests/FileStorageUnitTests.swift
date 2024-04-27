//
//  FileStorageUnitTests.swift
//  MKStorageTests
//
//  Created by Ke Ma on 27/04/2024.
//
import MKLotteryCore
import MKStorage
import XCTest

final class FileStorageUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        setupEmptyStoreState()
    }
    
    override func tearDown() {
        super.tearDown()
        
        undoStoreSideEffects()
    }
    
    func test_load_deliversEmptyOnEmptyCache() async {
        // Given
        let sut = makeSUT()
        
        // When
        let empty = try? await sut.load()
        
        // Then
        XCTAssertEqual(empty, [])
    }

    func test_load_deliversFoundValuesOnNonEmptyCache() async {
        // Given
        let sut = makeSUT()
        try? await sut.save(lotteries: givenLotteries)
        
        // When
        let lotteries = try? await sut.load()
        
        // Then
        XCTAssertEqual(lotteries, givenLotteries)
    }
    
    func makeSUT() -> FileStorage {
        FileStorage(storeURL: testSpecificStoreURL)
    }
    
    private func setupEmptyStoreState() {
        deleteStoreArtifacts()
    }
    
    private func undoStoreSideEffects() {
        deleteStoreArtifacts()
    }
    
    private func deleteStoreArtifacts() {
        try? FileManager.default.removeItem(at: testSpecificStoreURL)
    }
    
    private var testSpecificStoreURL: URL {
        cachesDirectory.appendingPathComponent("\(type(of: self)).store")
    }

    private var cachesDirectory: URL {
        FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }
    
    private let givenLotteries = [
        Lottery(id: "test-id", drawAt: Date(timeIntervalSince1970: 1), winningNumbers: ["1"], bonusBallNumber: "2", topPrize: 400)
    ]
}
