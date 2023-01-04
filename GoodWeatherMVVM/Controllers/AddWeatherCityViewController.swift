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
    }
    
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
