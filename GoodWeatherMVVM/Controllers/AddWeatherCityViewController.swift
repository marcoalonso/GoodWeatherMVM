//
//  AddWeatherCityViewController.swift
//  GoodWeatherMVVM
//
//  Created by Marco Alonso Rodriguez on 04/01/23.
//

import UIKit

class AddWeatherCityViewController: UIViewController {

    @IBOutlet weak var cityNameTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI(){
        self.navigationController?.navigationBar.backgroundColor = UIColor.systemBlue

        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        nav?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        nav?.tintColor = .white
    }
    
    @IBAction func saveCityButton(_ sender: Any) {
        if let city = cityNameTextfield.text {
            let weatherURL =  URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=698cb29c0a1e70d1a30a0a9982f6a95a&units=metric&lang=es&q=\(city)"
            )!
            let weatherResource = Resource(url: weatherURL) { data in
                return data
            }
            
            Webservice().load(resource: weatherResource) { result in
                print(result)
            }
        }
    }
    
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
