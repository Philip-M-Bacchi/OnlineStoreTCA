//
//  Array+Extensions.swift
//  OnlineStoreTCA
//
//  Created by Philip M. Bacchi on 3/5/23.
//

import Foundation

extension Array {
    @inlinable var staticFirst: Element {
        guard let element = self.first else {
            preconditionFailure("Invalid first element")
        }

        return element
    }
}
