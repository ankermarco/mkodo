//
//  LotteriesViewModel.swift
//  MKLotterySwiftUI
//
//  Created by Ke Ma on 25/04/2024.
//

import SwiftUI
import MKLotteryCore

final class LotteriesViewModel: ObservableObject {
    @Published var lotteries = [Lottery]()
    
    private let dataLoader: DataLoader
    
    init(dataLoader: DataLoader) {
        self.dataLoader = dataLoader
    }
    
    func loadLotteries() async {
        let loadedLotteries = await dataLoader.loadLotteries()

        await MainActor.run {
            self.lotteries = loadedLotteries
        }
    }
}
