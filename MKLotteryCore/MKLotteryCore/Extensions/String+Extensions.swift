//
//  String+Extensions.swift
//  MKLotteryCore
//
//  Created by Ke Ma on 24/04/2024.
//

import Foundation

public extension String {
    func dateFromISOString() -> Date? {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withFullDate]  // ignores time!
        return isoDateFormatter.date(from: self)  // returns nil, if isoString is malformed.
    }
}
