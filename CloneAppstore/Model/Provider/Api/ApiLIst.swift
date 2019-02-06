//
//  ApiLIst.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation

enum ApiList {
    case getFeatureList

    var url: String {
        switch self {
        case .getFeatureList:
            return "https://api.letsbuildthatapp.com/appstore/featured"
        }
    }
}
