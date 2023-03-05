//
//  UUID+Extensions.swift
//  OnlineStoreTCA
//
//  Created by Philip M. Bacchi on 3/5/23.
//

import Foundation

extension UUID {
    init(staticUUID: String) {
        guard let uuid = UUID(uuidString: staticUUID) else {
            preconditionFailure("Invalid static UUID: \(staticUUID)")
        }
        self = uuid
    }
}
