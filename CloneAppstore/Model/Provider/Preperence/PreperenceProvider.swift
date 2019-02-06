//
//  PreperenceProvider.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 06/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation
import RxSwift

protocol HasPreperenceProvider {
    var preperenceProvider: PreperenceProvider { get }
}

protocol PreperenceProvider {
    func setOnStart()
    func setNotOnStart()
    func isOnStarted() -> Observable<Bool>
}
