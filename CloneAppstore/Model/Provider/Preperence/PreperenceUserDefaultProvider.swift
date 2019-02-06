//
//  PreperenceDefaultProvider.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 06/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation
import RxSwift

class PreperenceUserDefaultProvider: PreperenceProvider {

    private let start = "start"
    private let defaults = UserDefaults.standard

    func setOnStart() {
        defaults.set(true, forKey: start)
    }

    func setNotOnStart() {
        defaults.removeObject(forKey: start)
    }

    func isOnStarted() -> Observable<Bool> {
        return UserDefaults.standard
            .rx
            .observe(Bool.self, start)
            .map { $0 ?? false }
    }

}
