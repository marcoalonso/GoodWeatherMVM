//
//  WeatherResponse.swift
//  GoodWeatherMVVM
//
//  Created by Marco Alonso Rodriguez on 04/01/23.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let cod: Int
    let main: Main
    let weather: [Weather]
}

struct Weather: Decodable {
    let description: String
    let icon: String
    let id: Int //propiedad computada que me cambiar el fondo
}

struct Main: Decodable {
    let temp: Double
}
