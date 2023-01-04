//
//  Double+Extension.swift
//  GoodWeatherMVVM
//
//  Created by Marco Alonso Rodriguez on 04/01/23.
//

import Foundation
extension Double {
    func formatAsDegree() -> String {
      return String(format: "%.0f°",self)
    }
}
