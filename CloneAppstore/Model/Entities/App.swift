//
//  App.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Himotoki

struct App {
    let id: Int // swiftlint:disable:this identifier_name
    let name: String
    let category: String
    let price: Double
    let imageName: String
}

extension App: Himotoki.Decodable {
    static func decode(_ extractor: Extractor) throws -> App {
        return try App(
            id: extractor <| "Id",
            name: extractor <| "Name",
            category: extractor <| "Category",
            price: extractor <| "Price",
            imageName: extractor <| "ImageName"
        )
    }
}
