//
//  SettingsViewModelTests.swift
//  GoodWeatherMVVMTests
//
//  Created by Marco Alonso Rodriguez on 10/01/23.
//

import XCTest
@testable import GoodWeatherMVVM

final class SettingsViewModelTests: XCTestCase {

    private var settingsVM : SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        
        self.settingsVM = SettingsViewModel()
    }

    //This test allow to know if the default unit selected is celcius
    func test_should_make_sure_that_default_selected_unit_is_celcius() {
        XCTAssertEqual(settingsVM.selectedUnit, .celcius)
    }
    
    func test_should_return_correct_display_name_for_celcius(){
        XCTAssertEqual(self.settingsVM.selectedUnit.displayName, "Celcius")
    }
    
    //save the user´s selection
    func test_should_be_able_to_save_user_unit_selection(){
        self.settingsVM.selectedUnit = .celcius
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
    }
    
    //clean all tests
    override func tearDown() {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }
    
    
}
