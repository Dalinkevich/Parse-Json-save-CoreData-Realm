//
//  Datas.swift
//  WeatherOneDay
//
//  Created by Роман далинкевич on 13.06.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import Foundation



struct Mains: Decodable {
    var coord: Coord
    var weather: [Weather]
    var base: String
    var main: Main
    var visibility: Int
    var wind: Wind
    var clouds: Clouds
    var dt: Int
    var sys: Sys
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
}

struct Coord: Decodable {
    var lon: Double
    var lat: Double
    
    init?(data: NSDictionary) {
        guard let lon = data["lon"] as? String,
              let lat = data["lat"] as? String else {
                return nil
        }
        self.lon = Double(lon) ?? 0
        self.lat = Double(lat) ?? 0
    }
}

struct Weather: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
    
    init?(data: NSDictionary) {
        guard let id = data["id"] as? String,
              let main = data["main"] as? String,
              let description = data["description"] as? String,
              let icon = data["icon"] as? String else {
                return nil
        }
        self.id = Int(id) ?? 0
        self.main = main
        self.description = description
        self.icon = icon
    }
}

struct Main: Decodable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Int
    var humidity: Int
    
    init?(data: NSDictionary) {
        guard let temp = data["temp"] as? String,
              let feels_like = data["feels_like"] as? String,
              let temp_min = data["temp_min"] as? String,
              let temp_max = data["temp_max"] as? String,
              let pressure = data["pressure"] as? String,
              let humidity = data["humidity"] as? String else {
            return nil
        }
        self.temp = Double(temp) ?? 0
        self.feels_like = Double(feels_like) ?? 0
        self.temp_min = Double(temp_min) ?? 0
        self.temp_max = Double(temp_max) ?? 0
        self.pressure = Int(pressure) ?? 0
        self.humidity = Int(humidity) ?? 0
  }
}

struct Wind: Decodable {
    var speed: Int
    var deg: Int
    
    init?(data: NSDictionary) {
        guard let speed = data["speed"] as? String,
              let deg = data["deg"] as? String else {
                return nil
        }
        self.speed = Int(speed) ?? 0
        self.deg = Int(deg) ?? 0
    }
}

struct Clouds: Decodable {
    var all: Int
    
    init?(data: NSDictionary) {
        guard let all = data["all"] as? String else {
            return nil
        }
        self.all = Int(all) ?? 0
    }
}

struct Sys: Decodable {
    var type: Int
    var id: Int
    var country: String
    var sunrise: Int
    var sunset: Int
    
    init?(data: NSDictionary) {
        guard let type = data["type"] as? String,
              let id = data["id"] as? String,
              let country = data["country"] as? String,
              let sunrise = data["sunrise"] as? String,
              let sunset = data["sunset"] as? String else {
                return nil
        }
        self.type = Int(type) ?? 0
        self.id = Int(id) ?? 0
        self.country = country
        self.sunrise = Int(sunrise) ?? 0
        self.sunset = Int(sunset) ?? 0
    }
}

