//
//  WeatherListViewModel.swift
//  GoodWeatherMVVM
//
//  Created by Marco Alonso Rodriguez on 04/01/23.
//

import Foundation

class WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel(_ vm: WeatherViewModel) {
        weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    
    func toCelcius() {
        //map all vms and convert to celcius
        weatherViewModels.map { vm in
            let weaterModel = vm
            weaterModel.temperature = (weaterModel.temperature - 32) * 5/9
            return weaterModel
        }
    }
    
    func toFahrenheit(){
        weatherViewModels.map { vm in
            let weaterModel = vm
            weaterModel.temperature = (weaterModel.temperature * 9/5) + 32
            return weaterModel
        }
    }
    
    func updateUnit(to unit: Unit) {
        switch unit {
        case .celcius:
            toCelcius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
}

class WeatherViewModel {
    let weather: WeatherResponse
    var temperature: Double
    
    init(weather: WeatherResponse) {
        self.weather = weather
        temperature = weather.main.temp
    }
    
    var city: String {
        weather.name
    }
    
    
}
