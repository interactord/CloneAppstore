//
//  APIService.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift

class ApiNetworkProvider: ApiProvider {

    private let network: Networking

    init(network: Networking) {
        self.network = network
    }

    func getFeatureList() -> Observable<Featured> {
        let url = ApiList.getFeatureList.url
        return network.request(method: .get, url: url, parameters: nil, type: Featured.self)
    }
}
