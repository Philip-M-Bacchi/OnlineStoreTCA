//
//  OnlineStoreTCAApp.swift
//  OnlineStoreTCA
//
//  Created by Pedro Rojas on 04/08/22.
//

import ComposableArchitecture
import SwiftUI

@main
struct OnlineStoreTCAApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(
                store: Store(
                    initialState: RootDomain.State(),
                    reducer: RootDomain.reducer,
                    environment: .live
                )
            )
        }
    }
}
