//
//  MKLotterySwiftUIApp.swift
//  MKLotterySwiftUI
//
//  Created by Ke Ma on 24/04/2024.
//

import MKLotteryCore
import SwiftUI
import MKStorage
import MKNetworking

@main
struct MKLotterySwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            if let url = FileStorage.fileURL() {
                LotteriesView(
                    viewModel: LotteriesViewModel(
                        dataLoader: LotteriesStore(
                            dataLoader: RemoteLotteryLoader(),
                            cache: FileStorage(storeURL: url)
                        )
                    )
                )
            }
        }
    }
}
