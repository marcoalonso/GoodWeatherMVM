//
//  WeatherListTableViewController.swift
//  GoodWeatherMVVM
//
//  Created by Marco Alonso Rodriguez on 04/01/23.
//

import UIKit

class WeatherListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        /*
        let resource = Resource(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=698cb29c0a1e70d1a30a0a9982f6a95a&units=metric&lang=es&q=morelia")!) { data in
            return try? JSONDecoder().decode(WeatherRrsponse.self, from: data)
        }
        
        Webservice().load(resource: resource) { weatherResponse in
            if let weatherResponse = weatherResponse {
                print(weatherResponse)
            }
        }
         */
        
    }
    
    
    func setupUI(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.systemBlue

        
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        nav?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        nav?.tintColor = .white
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        cell.textLabel?.text = "Morelia"
        cell.detailTextLabel?.text = "13° C"
        return cell
    }


}
