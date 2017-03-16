//
//  CoreApplicationPrototypeUITests.swift
//  CoreApplicationPrototypeUITests
//
//  Created by Thaddeus Sundin on 11/21/16.
//  Copyright © 2016 InboundRXCapstone. All rights reserved.
//

import XCTest

class CoreApplicationPrototypeUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    

    //Tests out the app(general): clicking all the tab bars, clicking history tabs, and clicking on deals
    //This is recorded code.
    func testExample() {
        
    }
    
    
    // Tests out functionality related to a user logging in
    // These include the restriction to rewards, the settings login/logout and create/edit account buttons status, and whether these entries
    // update upon moving to logged in or logged out status
    func testLogin(){
        let app = XCUIApplication()
        app.navigationBars["Home"].buttons["Settings"].tap()
        
        let tabBarsQuery = app.tabBars
   
        // Rewards should pop an error if entering the app without logging in and trying to access it.
        tabBarsQuery.buttons["Rewards"].tap()
        XCTAssert(app.alerts["Error"].exists)
        app.alerts["Error"].buttons["Cancel"].tap()
        
        
        tabBarsQuery.buttons["History"].tap()
        tabBarsQuery.buttons["Home"].tap()
        
        // Assert the UI stuff on the settings page is set correctly
        XCTAssert(app.buttons["Log In"].exists)
        XCTAssert(app.buttons["Create Account"].exists)
        
        // tab the login button on settings
        app.buttons["Log In"].tap()
        
        // This was recorded, enter a working account info
        let emailTextField = app.textFields["email address"]
        let passwordTextField = app.secureTextFields["password"]
        emailTextField.tap()
        emailTextField.typeText("example@example.com")
        passwordTextField.tap()
        passwordTextField.typeText("example")
        
        // Test the password visibility switch
        app.switches["0"].tap()
        XCTAssert(passwordTextField.exists == false)
        app.switches["1"].tap()
        XCTAssert(passwordTextField.exists)
        
        // Login to the app, then check rewards access for success
        app.buttons["Log In"].tap()
        tabBarsQuery.buttons["Rewards"].tap()
        XCTAssert(app.staticTexts["Rewards"].exists)
        
        // Go back to settings, then make sure the buttons read correctly
        tabBarsQuery.buttons["Home"].tap()
        app.navigationBars["Home"].buttons["Settings"].tap()
        XCTAssert(app.buttons["Log Out"].exists)
        XCTAssert(app.buttons["Edit Account"].exists)
        
        // Logout and make sure the login screen is displayed, and rewards is inaccessible.
        app.buttons["Log Out"].tap()
        XCTAssert(app.buttons["Log In"].exists)
        tabBarsQuery.buttons["Rewards"].tap()
        XCTAssert(app.alerts["Error"].exists)
        app.alerts["Error"].buttons["Cancel"].tap()
    }
    
    
    // Test whether a user rushing to the login page can login
    // while the login page is pulling from the server
    func testFastLoginInvalid() {
        let app = XCUIApplication()
        app.navigationBars["Home"].buttons["Settings"].tap()
        app.buttons["Log In"].tap()
        let emailTextField = app.textFields["email address"]
        let passwordTextField = app.secureTextFields["password"]
        emailTextField.tap()
        emailTextField.typeText("whargarbl")
        passwordTextField.tap()
        passwordTextField.typeText("whargarbl")
        app.buttons["Log In"].tap()
        XCTAssert(app.alerts["Error"].exists)
    }
    
    
    //Test out the setting page, So far this is only a switch for notification, and the labels involved.  Login tests the create
    // and edit button for validity.
    func testSettings(){
        
        let app = XCUIApplication()
        let settingsButton = app.buttons["Settings"]
        settingsButton.tap()
        app.switches["1"].tap()
        XCTAssert(app.switches["0"].exists)
        XCTAssert(app.staticTexts["Notifications: Off"].exists)
        app.switches["0"].tap()
        XCTAssert(app.switches["1"].exists)
        XCTAssert(app.staticTexts["Notifications: On"].exists)

    }
    
    
    //Tests the tab bar, to make sure the correct view is showing up to the 
    //corresponding bar button, needs assertions
    func testTabBar(){
        XCUIDevice.shared().orientation = .portrait
        
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        let aboutButton = tabBarsQuery.buttons["About"]
        aboutButton.tap()
        
        let historyButton = tabBarsQuery.buttons["History"]
        historyButton.tap()
        tabBarsQuery.buttons["Rewards"].tap()
        app.alerts["Error"].buttons["Cancel"].tap()
        tabBarsQuery.buttons["Home"].tap()
        aboutButton.tap()
        historyButton.tap()

    }
    
    
    
}
