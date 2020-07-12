//
//  CoreDataManager.swift
//  14.2
//
//  Created by Роман далинкевич on 06.07.2020.
//  Copyright © 2020 Роман далинкевич. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var weatherDatas = [WeatherDatas]()
    
    
    func saveCoreData(item: Mains) {
        let weather = WeatherDatas(context: context)
            
        weather.name = item.name
        weather.temp = item.main.temp
        weather.pressure = Int32(item.main.pressure)
        weather.humidity = Int32(item.main.humidity)
        weather.cloud = Int32(item.clouds.all)
        weather.speed = Int32(item.wind.speed)

        do {
            try context.save()
            print("Saving failed")
        } catch let error as NSError {
            print("Data is not saved. Error: \(error), \(error.userInfo)")
        }

    }
    
    func readDataFromCoreData() -> ([WeatherDatas]) {
    
        var result = [WeatherDatas]()
        
        var fetchResultController: NSFetchedResultsController<WeatherDatas>!
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
            
        let fetchRequest: NSFetchRequest<WeatherDatas> = WeatherDatas.fetchRequest()
        
        fetchRequest.sortDescriptors = [sortDescriptor]

        fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        
        do {
            try fetchResultController.performFetch()
            result = fetchResultController.fetchedObjects! 
            print("Data is read")
        } catch let error as NSError {
            print("Data isn't read. Error: \(error), \(error.userInfo)")
        }
        
        
        return (result)
    }
    
}
