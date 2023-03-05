//
//  ProductDomain.swift
//  OnlineStoreTCA
//
//  Created by Pedro Rojas on 21/08/22.
//

import ComposableArchitecture
import Foundation

struct ProductDomain {
    struct State: Equatable, Identifiable {
        let id: UUID
        let product: Product
        var addToCartState = AddToCartDomain.State()

        var count: Int {
            self.addToCartState.count
        }
    }

    enum Action: Equatable {
        case addToCart(AddToCartDomain.Action)
    }

    struct Environment {}

    static let reducer = Reducer<
        State, Action, Environment
    >.combine(
        AddToCartDomain.reducer
            .pullback(
                state: \.addToCartState,
                action: /ProductDomain.Action.addToCart,
                environment: { _ in
                    AddToCartDomain.Environment()
                }
            ),
        .init { state, action, _ in
            switch action {
            case .addToCart(.didTapPlusButton):
                return .none
            case .addToCart(.didTapMinusButton):
                state.addToCartState.count = max(0, state.addToCartState.count)
                return .none
            }
        }
    )
}
