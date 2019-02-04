//
//  Category.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Himotoki

struct Category {
    let name: String
    let apps: [App]
    let type: String
}

extension Category: Himotoki.Decodable {
    static func decode(_ extactor: Extractor) throws -> Category {
        return try Category(
            name: extactor <| "name",
            apps: extactor <|| "apps",
            type: extactor <| "type"
        )
    }
}
