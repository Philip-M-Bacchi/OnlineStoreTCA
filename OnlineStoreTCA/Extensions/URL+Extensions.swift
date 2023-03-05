//
//  URL+Extensions.swift
//  OnlineStoreTCA
//
//  Created by Philip M. Bacchi on 3/5/23.
//

import Foundation

// See https://www.swiftbysundell.com/articles/constructing-urls-in-swift/ for details
extension URL {
    init(staticString string: StaticString) {
        guard let url = URL(string: "\(string)") else {
            preconditionFailure("Invalid static URL string: \(string)")
        }

        self = url
    }
}
