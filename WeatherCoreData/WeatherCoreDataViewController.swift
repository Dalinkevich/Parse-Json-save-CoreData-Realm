//
//  WeatherCoreDataViewController.swift
//  14.2
//
//  Created by Роман далинкевич on 05.07.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import UIKit

class WeatherCoreDataViewController: UIViewController {


    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var tempLabel: UILabel!
    
    @IBOutlet var pressureLabel: UILabel!
    
    @IBOutlet var humidityLabel: UILabel!
    
    @IBOutlet var cloudsLabel: UILabel!
    
    @IBOutlet var windSpeedLabel: UILabel!
    
    
           override func viewDidLoad() {
               super.viewDidLoad()
               let loader = LoaderWeather()
               loader.loadWeather()
               loader.delegate = self
            
            readData()
    }
    
    private func readData() {
        if let tempW = CoreDataManager.shared.readDataFromCoreData().last {
            self.nameLabel.text = "\(tempW.name ?? "")"
            self.tempLabel.text = "Temperature \(tempW.temp) Fahrenheit"
            self.pressureLabel.text = "Atmospheric pressure: \(tempW.pressure) hPa"
            self.humidityLabel.text = "Humidity: \(tempW.humidity) %"
            self.cloudsLabel.text = "Cloudiness: \(tempW.cloud) %"
            self.windSpeedLabel.text = "Wind speed: \(tempW.speed) miles/hour"
        }
    }
}


extension WeatherCoreDataViewController: WeatherLoaderDelegate {
    func loaded(weather: Mains) {
        DispatchQueue.main.async {
            
            let temp = WeatherItem()
            temp.name = weather.name
            temp.temp = weather.main.temp
            temp.pressure = weather.main.pressure
            temp.humidity = weather.main.humidity
            temp.cloud = weather.clouds.all
            temp.speed = weather.wind.speed
            
            CoreDataManager.shared.saveCoreData(item: weather)
            
            self.readData()
            
        }
    }
}

