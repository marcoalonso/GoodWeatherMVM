//
//  Webservice.swift
//  GoodWeatherMVVM
//
//  Created by Marco Alonso Rodriguez on 04/01/23.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class Webservice {
    func load <T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let safeData = data {
                DispatchQueue.main.async {
                    completion(resource.parse(safeData))
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
