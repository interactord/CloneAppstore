//
//  Feartured.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Himotoki

struct Featured {
    let bannerCategory: Category
    let categories: [Category]
}

extension Featured: Himotoki.Decodable {
    static func decode(_ extactor: Extractor) throws -> Featured {
        return try Featured(
            bannerCategory: extactor <| "bannerCategory",
            categories: extactor <|| "categories"
        )
    }
}
