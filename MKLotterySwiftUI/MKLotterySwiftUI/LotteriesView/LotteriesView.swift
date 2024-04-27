//
//  ContentView.swift
//  MKLotterySwiftUI
//
//  Created by Ke Ma on 24/04/2024.
//

import SwiftUI
import MKLotteryCore
import MKNetworking


struct LotteriesView: View {
    @StateObject
    var viewModel: LotteriesViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.lotteries) { lottery in
                NavigationLink {
                    // Detail screen
                    LotteryDetailView(
                        numbers: lottery.winningNumbers,
                        bonus: lottery.bonusBallNumber,
                        drawAt: lottery.drawAt,
                        topPrize: lottery.topPrize)
                } label: {
                    LotteryCardView(
                        numbers: lottery.winningNumbers,
                        bonus: lottery.bonusBallNumber,
                        drawAt: lottery.drawAt
                    )
                }
                .navigationTitle("Draw History")
            }
        }
        .onAppear {
            Task {
                await viewModel.loadLotteries()
            }
        }
    }
}
