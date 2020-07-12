//
//  Response.swift
//  WeatherOneDay
//
//  Created by Роман далинкевич on 13.06.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import Foundation

protocol WeatherLoaderDelegate {
    func loaded(weather: Mains)
}

class LoaderWeather {
    
  var delegate: WeatherLoaderDelegate?
    
    func loadWeather() {
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=St.%20Petersburg&appid={yourId}")!
        //https://openweathermap.org/current
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                do {
                    let json = try JSONDecoder().decode(Mains.self, from: data)
                    self.delegate?.loaded(weather: json)
                    
            } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
