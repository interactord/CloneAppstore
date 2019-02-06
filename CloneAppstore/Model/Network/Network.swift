//
//  baseNetwork.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 04/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation
import RxSwift
import Himotoki
import Alamofire

protocol HasNetork {
    var network: Networking { get }
}

protocol Networking {
    func request<D: Himotoki.Decodable>(method: NetworkMethod, url: String, parameters: [String: Any]?, type: D.Type) -> Observable<D>

    func request(method: NetworkMethod, url: String, parameters: [String: Any]?) -> Observable<Any>

    func image(url: String) -> Observable<UIImage>
}

final class Network: Networking {

    private let queue = DispatchQueue(label: "core.Network.Queue")

    func request<D: Himotoki.Decodable>(method: NetworkMethod, url: String, parameters: [String: Any]?, type: D.Type) -> Observable<D> {
        return request(method: method, url: url, parameters: parameters)
            .map {
                do {
                    return try D.decodeValue($0)
                } catch {
                    print(error)

                    throw NetworkError.incorrectDataReturned
                }
        }
    }

    func request(method: NetworkMethod, url: String, parameters: [String: Any]?) -> Observable<Any> {
        return Observable.create { observer in
            let method = method.httpMethod()

            let request = Alamofire.request(url, method: method, parameters: parameters)
                .validate()
                .responseJSON(queue: self.queue) { response in
                    switch response.result {
                    case .success(let value):
                        observer.onNext(value)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(NetworkError(error: error))
                    }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }

    func image(url: String) -> Observable<UIImage> {
        return Observable.create { observer in
            let request = Alamofire.request(url, method: .get)
                .validate()
                .response(queue: self.queue, responseSerializer: Alamofire.DataRequest.dataResponseSerializer()) { response in
                    switch response.result {
                    case .success(let data):
                        guard let image = UIImage(data: data) else {
                            observer.onError(NetworkError.incorrectDataReturned)
                            return
                        }
                        observer.onNext(image)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
