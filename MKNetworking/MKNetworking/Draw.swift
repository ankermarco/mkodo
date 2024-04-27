//
//  Draw.swift
//  MKNetworking
//
//  Created by Ke Ma on 24/04/2024.
//

import Foundation

public struct Draw: Codable {
    let draws: [DrawItem]
    
    public init(draws: [DrawItem]) {
        self.draws = draws
    }
}
