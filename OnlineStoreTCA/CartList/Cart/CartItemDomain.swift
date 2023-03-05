//
//  CartItemDomain.swift
//  OnlineStoreTCA
//
//  Created by Pedro Rojas on 22/08/22.
//

import ComposableArchitecture
import Foundation

struct CartItemDomain {
    struct State: Equatable, Identifiable {
        let id: UUID
        let cartItem: CartItem
    }

    enum Action: Equatable {
        case deleteCartItem(product: Product)
    }

    struct Environment {}

    static let reducer = Reducer<
        State, Action, Environment
    > { _, action, _ in
        switch action {
        case .deleteCartItem:
            return .none
        }
    }
}
