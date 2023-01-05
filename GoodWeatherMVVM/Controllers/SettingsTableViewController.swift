//
//  SettingsTableViewController.swift
//  GoodWeatherMVVM
//
//  Created by Marco Alonso Rodriguez on 05/01/23.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    private var settingsViewModel = SettingsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return settingsViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsItem = settingsViewModel.units[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        cell.textLabel?.text = settingsItem.displayName
        return cell
    }
    
    @IBAction func doneButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

}
