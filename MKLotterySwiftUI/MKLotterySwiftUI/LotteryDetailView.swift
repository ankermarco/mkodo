//
//  LotteryDetailView.swift
//  MKLotterySwiftUI
//
//  Created by Ke Ma on 25/04/2024.
//

import SwiftUI

struct LotteryDetailView: View {
    let numbers: [String]
    let bonus: String
    let drawAt: Date
    let topPrize: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Group {
                Text("Top prize: ") +
                Text(topPrize, format: .currency(code: "GBP"))
            }.font(.title)
            
            LotteryCardView(
                numbers: numbers,
                bonus: bonus,
                drawAt: drawAt
            )
        }
        .padding(.horizontal, 16)
        Spacer()
    }
}
