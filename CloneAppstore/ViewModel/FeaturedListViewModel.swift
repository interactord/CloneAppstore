//
//  FeaturedListViewModel.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift
import RxCocoa

protocol FeaturedListViewModelInput {
}

protocol FeaturedListViewModelOutput {
}

class FeaturedListViewModel {
    private let network: Network
    private let apiService: ApiService

    init(network: Network, apiService: ApiService) {
        self.network = network
        self.apiService = apiService
    }

}
