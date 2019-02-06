//
//  Service.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 06/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation

struct Service: HasApiProvider, HasPreperenceProvider {
    let apiProvider: ApiProvider

    let preperenceProvider: PreperenceProvider

    init(apiProvider: ApiProvider, preperenceProvider: PreperenceProvider) {
        self.apiProvider = apiProvider
        self.preperenceProvider = preperenceProvider
    }
}
