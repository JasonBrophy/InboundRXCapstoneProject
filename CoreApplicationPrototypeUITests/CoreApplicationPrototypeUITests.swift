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
    
    func testExample() {
        
        let app = XCUIApplication()
        let xcodemedsImage = app.images["XcodeMeds"]
        xcodemedsImage.swipeLeft()
        xcodemedsImage.swipeLeft()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Rewards"].tap()
        tabBarsQuery.buttons["About"].tap()
        
        let historyButton = tabBarsQuery.buttons["History"]
        historyButton.tap()
        
        let tablesQuery = app.tables
        tablesQuery.staticTexts["1969"].tap()
        tablesQuery.cells.staticTexts["1972"].tap()
        
        let staticText = tablesQuery.staticTexts["1984"]
        staticText.tap()
        tablesQuery.staticTexts["1993"].tap()
        staticText.tap()
        
        let homeButton = tabBarsQuery.buttons["Home"]
        homeButton.tap()
        historyButton.tap()
        staticText.tap()
        homeButton.tap()
        xcodemedsImage.swipeLeft()
        xcodemedsImage.tap()
        app.staticTexts["20"].tap()
        app.buttons["Settings"].tap()
        app.switches["1"].tap()
        app.switches["0"].tap()
        app.buttons["Edit Account Details"].tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLogin(){
        
    }
    
    func testSettings(){
        let app = XCUIApplication()
        let settingsButton = app.buttons["Settings"]
        settingsButton.tap()
        app.switches["1"].tap()
        XCTAssertEqual("Notifications: Off", app.staticTexts["NotificationLabel"].label)
        app.switches["0"].tap()
        XCTAssertEqual("Notifications: On", app.staticTexts["NotificationLabel"].label)

        
        
        
    }
    
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
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }
    
}
