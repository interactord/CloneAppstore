//
//  PreperenceProvider.swift
//  CloneAppstore
//
//  Created by SANGBONG MOON on 06/02/2019.
//  Copyright © 2019 Scott Moon. All rights reserved.
//

import Foundation

protocol HasPreperenceProvider {
    var preperenceProvider: PreperenceProvider { get }
}

protocol PreperenceProvider {
    func setOnBoard()
    func setNotOnBoard()
    func isOnBoarded() -> Bool
}
