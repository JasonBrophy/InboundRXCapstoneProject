//
//  CoreApplicationPrototypeTests.swift
//  CoreApplicationPrototypeTests
//
//  Created by Thaddeus Sundin on 11/21/16.
//  Copyright © 2016 InboundRXCapstone. All rights reserved.
//

import XCTest
@testable import CoreApplicationPrototype

class CoreApplicationPrototypeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // Unit test the user login and logout functions.  This does
    // Test the webCallController function as well.
    func testUser() {
        let user = User(userEmail: "noUser")
        XCTAssertTrue(user.loggedIn() == false)
        var result = user.loginUser(emailField: "example@example.com", passwordField: "example")
        XCTAssert(result.0)
        XCTAssert(user.loggedIn())
        result = user.logOut()
        XCTAssert(result.0)
        XCTAssertTrue(user.loggedIn() == false)
    }
    
    
    // Test the webCallController daily Deals web call
    // First set an expectation, then, make the callback function call
    // Inside do any tests desired, (here make sure if error we get no list)
    // and an error message.  If no error, make sure any deals contained
    // are actually daily deals, then fulfill the set expectation
    // so it doesnt time out.
    func testDealsWebCall () {
        let exp = expectation(description: "getDailyDeals")
        let webCallController = WebCallController()
        webCallController.getDailyDealList(callback: { (isError, errorMessage, dailyDealsList) in
            if isError {
                XCTAssertNotNil(errorMessage)
                XCTAssertNil(dailyDealsList)
            } else {
                for dict in dailyDealsList! {
                    XCTAssert(dict["daily_deal"] as! Bool)
                }
            }
            exp.fulfill()
        })
        waitForExpectations(timeout: 15, handler: nil)
    }
    
    // Test the webCallController Rewards web call
    // First set an expectation, then, make the callback function call
    // Inside do any tests desired, (here make sure if error we get no list)
    // and an error message.  If no error, make sure any deals contained
    // are actually rewards.  Once this is done, fulfill the expectation
    // so it doesn't time out and fail
    func testRewardsWebCall () {
        let exp = expectation(description: "getRewards")
        let webCallController = WebCallController()
        webCallController.getRewardsList(callback: { (isError, errorMessage, rewardsList) in
            if isError {
                XCTAssertNotNil(errorMessage)
                XCTAssertNil(rewardsList)
            } else {
                for dict in rewardsList! {
                    XCTAssertFalse(dict["daily_deal"] as! Bool)
                }
            }
            exp.fulfill()
        })
        waitForExpectations(timeout: 15, handler: nil)
    }
    
    func testCreateAccount () {
        let webCallController = WebCallController()
        var result = webCallController.createNewUser(userDict: ["email": "example@example.com", "password": "example2"])
        XCTAssert(result.0)
        result = webCallController.createNewUser(userDict: ["email": "example", "password": "password"])
        XCTAssert(result.0)
        result = webCallController.createNewUser(userDict: ["email": "whargarbl@whargarbl.com", "password": "pass"])
        XCTAssert(result.0)
    }
    
    func testEditAccount () {
        let webCallController = WebCallController()
        let user = User(userEmail: "noUser")
        var result = user.loginUser(emailField: "bob@bob.com", passwordField: "bobbob")
        XCTAssertFalse(result.0)
        XCTAssert(user.loggedIn())
        result = webCallController.editUser(userDict: ["email": "bob@bob.com", "current_password": "bobbob", "password": "bobbobbob", "password_confirmation": "bobbobbob"])
        XCTAssertFalse(result.0)
        result = user.loginUser(emailField: "bob@bob.com", passwordField: "bobbob")
        XCTAssert(result.0)
        XCTAssertFalse(user.loggedIn())
        result = user.loginUser(emailField: "bob@bob.com", passwordField: "bobbobbob")
        XCTAssertFalse(result.0)
        XCTAssert(user.loggedIn())
        result = user.logOut()
        XCTAssertFalse(user.loggedIn())
        

    }
}
