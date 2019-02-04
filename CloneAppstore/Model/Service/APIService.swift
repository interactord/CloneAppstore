//
//  APIService.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift

protocol ApiService {
    func getFeatureList() -> Observable<Featured>
}
