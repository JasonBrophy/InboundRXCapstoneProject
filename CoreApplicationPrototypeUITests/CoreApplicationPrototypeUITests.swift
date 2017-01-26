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
    
    
    
    
    
    
    
    
    //Tests out the app(general): clicking all the tab bars, clicking histoy tabs, and clicking on deals
    //This is recorded code.
    func testExample() {
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Rewards"].tap()
        tabBarsQuery.buttons["History"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.staticTexts["1969"].tap()
        tablesQuery.staticTexts["1972"].tap()
        tablesQuery.staticTexts["1984"].tap()
        
        let staticText = tablesQuery.staticTexts["1993"]
        staticText.tap()
        staticText.tap()
        tabBarsQuery.buttons["About"].tap()
        
        let homeButton = tabBarsQuery.buttons["Home"]
        homeButton.tap()
        app.buttons["Daily Deals"].swipeLeft()
        
        let xcodemedsImage = app.images["XcodeMeds"]
        xcodemedsImage.swipeLeft()
        xcodemedsImage.swipeLeft()
        xcodemedsImage.swipeLeft()
        xcodemedsImage.swipeLeft()
        homeButton.tap()
        app.images["Paulsens Coffee Bar BW"].tap()
    }
    
    
    //Tests out the login page.
    //First, starts at the home page
    //Click on setting on the home page, then log out
    //In the next view, sign in page, type in email and password. Make sure password shows by clicking switch
    //Finally hit login.
    //NOTE: this test is meant to fail.
    func testLogin(){
        
        let app = XCUIApplication()
        app.navigationBars["Home"].buttons["Settings"].tap()
        
        let logOutButton = app.tables.buttons["Log Out"]
        logOutButton.tap()
        XCTAssert(app.staticTexts["Log In"].exists)
        XCTAssertTrue(app.tabBars.buttons["Rewards"].isHittable == false)
        let emailTextField = app.textFields["email address"]
        let passwordTextField = app.secureTextFields["password"]
        emailTextField.tap()
        emailTextField.typeText("bob@example.com")
        passwordTextField.tap()
        passwordTextField.typeText("password")
        app.switches["0"].tap()
        XCTAssert(passwordTextField.exists == false)
        app.switches["1"].tap()
        XCTAssert(passwordTextField.exists)
        app.buttons["Log In"].tap()
        XCTAssert(app.tabBars.buttons["Rewards"].isHittable)

        
    }
    
    
    //Test out the setting page, So far this is only a switch for notification
    func testSettings(){
        
        let app = XCUIApplication()
        let settingsButton = app.buttons["Settings"]
        settingsButton.tap()
        app.switches["1"].tap()
        XCTAssert(app.switches["0"].exists)
        app.switches["0"].tap()
        XCTAssert(app.switches["1"].exists)
    }
    
    
    //Tests the tab bar, to make sure the correct view is showing up to the 
    //corresponding bar button. 
    func testTabBar(){
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        XCTAssert(app.buttons["Settings"].exists)
        tabBarsQuery.buttons["Rewards"].tap()
        XCTAssert(app.staticTexts["Rewards"].exists)

        // XCTAssert(app.buttons["Redeem"].exists)
        tabBarsQuery.buttons["About"].tap()
        XCTAssert(app.staticTexts["About"].exists)

        let historyButton = tabBarsQuery.buttons["History"]
        historyButton.tap()
        XCTAssert(app.staticTexts["History"].exists)
        XCTAssert(app.tables.element.exists)
        let homeButton = tabBarsQuery.buttons["Home"]
        homeButton.tap()
        XCTAssert(app.staticTexts["Home"].exists)
    }
    
    
    
}
