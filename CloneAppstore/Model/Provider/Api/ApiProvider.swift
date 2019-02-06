//
//  Provider.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 06/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift

protocol HasApiProvider {
    var apiProvider: ApiProvider { get }
}

protocol ApiProvider {

    func getFeatureList() -> Observable<Featured>
    func getDetailApp(appId: Int) -> Observable<AppDetail>
}
