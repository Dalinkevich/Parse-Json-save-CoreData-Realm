//
//  WeatherItem.swift
//  14.2
//
//  Created by Роман далинкевич on 04.07.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import Foundation
import RealmSwift

class WeatherItem: Object {
    @objc dynamic var name = ""
    @objc dynamic var temp = 0.0
    @objc dynamic var pressure = 0
    @objc dynamic var humidity = 0
    @objc dynamic var cloud = 0
    @objc dynamic var speed = 0
}
