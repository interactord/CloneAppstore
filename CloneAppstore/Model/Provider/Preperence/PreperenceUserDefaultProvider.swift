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

    private let onBoard = "onBoard"
    private let defaults = UserDefaults.standard

    func setOnBoard() {
        defaults.set(true, forKey: onBoard)
    }

    func setNotOnBoard() {
        defaults.removeObject(forKey: onBoard)
    }

    func isOnBoarded() -> Bool {
        return defaults.bool(forKey: onBoard)
    }

}
