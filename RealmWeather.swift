//
//  RealmWeather.swift
//  14.2
//
//  Created by Роман далинкевич on 04.07.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import Foundation
import RealmSwift

class RealmWeather {
    
    static let shared = RealmWeather()
    
    var realm = try! Realm()
    
    func save(item: WeatherItem) {
        try! realm.write {
            realm.add(item)
        }
    }
    
    func getItems() -> Results<WeatherItem> {
        realm.objects(WeatherItem.self)
    }
}
