//
//  AppInformation.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 07/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Himotoki

struct AppInformation {
    let name: String
    let value: String
}

extension AppInformation: Himotoki.Decodable {
    static func decode(_ extactor: Extractor) throws -> AppInformation {
        return try AppInformation(
            name: extactor <| "Name",
            value: extactor <| "Value"
        )
    }
}
