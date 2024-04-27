//
//  LotteryCardView.swift
//  MKLotterySwiftUI
//
//  Created by Ke Ma on 25/04/2024.
//

import SwiftUI

struct LotteryCardView: View {
    let numbers: [String]
    let bonus: String
    let drawAt: Date
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 10) {
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(drawAt.formatted(date: .complete, time: .omitted))
            }
            HStack(alignment: .center, spacing: 8) {
                ForEach(numbers, id: \.self) { number in
                    Circle()
                        .fill(Color.blue)
                        .overlay(
                            Text(number)
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        )
                    
                }
                Circle()
                    .fill(Color.yellow)
                    .overlay(
                        Text(bonus)
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                    )
            }
        }
        
    }
}


#Preview {
    LotteryCardView(
        numbers: ["10", "54", "32", "90", "4"],
        bonus: "3",
        drawAt: "2022-05-21".dateFromISOString() ?? Date()
    )
}
