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
        
        
    }
    
    
    func setupUI(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.systemBlue

        
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        nav?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        nav?.tintColor = .white
        
    }



}
