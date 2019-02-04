//
//  Network.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import RxSwift
import Himotoki

protocol Network {
    func request<D: Himotoki.Decodable>(method: NetworkMethod, url: String, parameters: [String: Any]?, type: D.Type) -> Observable<D>

    func request(method: NetworkMethod, url: String, parameters: [String: Any]?) -> Observable<Any>

    func image(url: String) -> Observable<UIImage>
}
