//
//  FirstPresenter.swift
//  GeoLocation recipe
//
//  Created by satish.birajdar on 2019-02-21.
//

import Foundation
import CoreLocation

protocol FirstDelegate {}

class FirstPresenter {
    var delegate: FirstDelegate

    init(delegate: FirstDelegate) {
        self.delegate = delegate
    }
}
