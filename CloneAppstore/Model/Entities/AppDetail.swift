//
//  appDetail.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 07/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Himotoki

struct AppDetail {
    let id: Int // swiftlint:disable:this identifier_name
    let name: String
    let category: String
    let price: String
    let imageName: String
    let screenShots: [String]
    let description: String
    let appInformation: [AppInformation]
}

extension AppDetail: Himotoki.Decodable {
    static func decode(_ extactor: Extractor) throws -> AppDetail {
        return try AppDetail(
            id: extactor <| "Id",
            name: extactor <| "Name",
            category: extactor <| "Category",
            price: extactor <| "Price",
            imageName: extactor <| "ImageName",
            screenShots: extactor <|| "Screenshots",
            description: extactor <| "description",
            appInformation: extactor <|| "appInformation"
        )
    }
}
