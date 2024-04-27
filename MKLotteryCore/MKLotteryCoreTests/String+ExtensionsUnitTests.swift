//
//  String+ExtensionsUnitTests.swift
//  MKLotteryCoreTests
//
//  Created by Ke Ma on 24/04/2024.
//

import XCTest
import MKLotteryCore

final class String_ExtensionsUnitTests: XCTestCase {
    func test_dateFromISOString_returnsExpectedDate_givenValidISODateString() {
        let givenDate = "2023-05-29"
        XCTAssertNotNil(givenDate.dateFromISOString())
    }

    func test_dateFromISOString_returnsNil_givenInvalidISODateString() {
        let givenDate = "invalid-string"
        XCTAssertNil(givenDate.dateFromISOString())
    }

}
