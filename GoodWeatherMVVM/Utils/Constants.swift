//
//  Constants.swift
//  GoodWeatherMVVM
//
//  Created by Marco Alonso Rodriguez on 04/01/23.
//
import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            
            // get the default settings for temperature
           // let userDefaults = UserDefaults.standard
           // let unit = (userDefaults.value(forKey: "unit") as? String) ?? "imperial"
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=698cb29c0a1e70d1a30a0a9982f6a95a&units=metric&lang=es")!
        }
        
    }
    
}
