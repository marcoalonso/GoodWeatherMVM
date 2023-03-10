//
//  WeatherListTableViewController.swift
//  GoodWeatherMVVM
//
//  Created by Marco Alonso Rodriguez on 04/01/23.
//

import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {
    
    private var weatherListViewModel = WeatherListViewModel()
    private var lastUnitSelection : Unit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        let userDefaults = UserDefaults.standard
        if let value = userDefaults.value(forKey: "unit") as? String {
            self.lastUnitSelection = Unit(rawValue: value)!
        }
        
    }
    
    //MARK: Delegate Func
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
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
        return weatherListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        
        let weatherVM = weatherListViewModel.modelAt(indexPath.row)
        
        cell.textLabel?.text = weatherVM.city
        cell.detailTextLabel?.text = "\(weatherVM.temperature.formatAsDegree())"
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        } else if segue.identifier == "SettingsTableViewController" {
            prepareSegueForSettingsTableViewController(segue: segue)
        }
    }
    
    //unwind segue
    func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        //get the navController and extract th VC
        guard let nav = segue.destination as? UINavigationController else { fatalError("Navigation controller not found")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController not found")
        }
        
        addWeatherCityVC.delegate = self
    }
    
    func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else { fatalError("Navigation controller not found")
        }
        
        guard let settingsTVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("AddWeatherCityViewController not found")
        }
        
        settingsTVC.delegate = self
    }

}

extension WeatherListTableViewController: SettingDelegate {
    func settingsDone(vm: SettingsViewModel) {
        //upgrade if there are changes in the units
        if lastUnitSelection.rawValue != vm.selectedUnit.rawValue {
            weatherListViewModel.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastUnitSelection = Unit(rawValue: vm.selectedUnit.rawValue)!
        }
    }
}
