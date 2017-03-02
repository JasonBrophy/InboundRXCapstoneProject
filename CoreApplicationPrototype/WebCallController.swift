//
//  WebCallController.swift
//  CoreApplicationPrototype
//
//  Created by Thaddeus Sundin on 2/27/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

/*
 Important note about making HTTP web calls:
 Must edit info.plist
    Add the key "App Transport Security Settings" of type Dictionary
    Under this key, add the subkey "Allow Arbitrary Loads" of type Boolean and set it to "YES"
    (If this still doesn't work, clean the project (Shift+Command+k))
 */

class WebCallController {
    
    
    // Make a call to a web address to retrieve some data
    // Returns an array of dictionaries via a completion handler
    func webCall(urlToCall: String, callback: @escaping (Dictionary<String, AnyObject>) -> ()) {
        let url = URL(string: urlToCall)
        let session = URLSession.shared
        session.dataTask(with: url!) { (data, response, error) in
            
            // If there was an error, print it to the console and return from the function
            if error != nil {
                print("There was an error!:\n")
                print(error!)
                return
            }
            
            // Otherwise, print the data to the console
//            let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//            print("\n\nDataRecieved:\n")
//            print(str!)
//            print("\n-----\n")
            
            // Otherwise, convert the data recieved into JSON
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                // let dictionaryArray = json as! [[String: AnyObject]]
                let dictionaryArray = json as! Dictionary<String, AnyObject>
                callback(dictionaryArray)
            } catch let jsonError {
                print("There was a json error!:\n")
                print(jsonError)
            }
            
            }.resume()
    }

    // Make a call to the web server to sign in
    // Callback function is run syncronously after this function
    func webLogIn(urlToCall: String) {
        // Prepare json data
        let json = ["user": ["email": "test@test.com", "password": "password123"]]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // Create post request
        let url = URL(string: urlToCall)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Insert a header specifying that json data is in the request
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        // Insert the actual json data into the request
        request.httpBody = jsonData
        
        //Create a semaphore
        let semaphore = DispatchSemaphore(value: 0)
        
        // Execute the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // If there was an error, print it to the console and return from the function
            if error != nil {
                print("There was an error!:\n")
                print(error!)
                return
            }
            // Otherwise, print the data to the console
//            let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//            print("\n\nDataRecieved:\n")
//            print(str!)
//            print("\n-----\n")
            
            // Signal the semaphore
            semaphore.signal()
        }
        // Let the dataTask resume (run the urlsession request, essentially)
        task.resume()
        // Wait on the semaphore within the callback function
        semaphore.wait()
    }

    //Print the list of beacons to the console
    func printBeaconList() {
        // Test logging in
        webLogIn(urlToCall: "http://paulsens-beacon.herokuapp.com/login")
        
        webCall(urlToCall: "http://paulsens-beacon.herokuapp.com/beacons.json") { (dictionaryArray) in
            var i = 1
            let beaconsList = dictionaryArray["beacons"] as? Array<Dictionary<String, AnyObject>>
            for dictionary in beaconsList! {
                print("Dictionary \(i):\n")
                print(dictionary)
                print("\n-----\n")
                i = i+1
            }
        }
    }
    
    //Returns an array of dictionaries, where each dictionary represents a beacon in the web server
    //Returns nil if the web server call does not correctly return data
    //NOTE: Returns data via closure
    func getBeaconList(callback: @escaping (Array<Dictionary<String, AnyObject>>?) -> ()) {
        //Log in
        webLogIn(urlToCall: "http://paulsens-beacon.herokuapp.com/login")
        
        //Call web server to return beacon list
        webCall(urlToCall: "http://paulsens-beacon.herokuapp.com/beacons.json") { (beaconJson) in
            if let beaconList = beaconJson["beacons"] as? Array<Dictionary<String, AnyObject>>{
                callback(beaconList)
            }
            else {
                callback(nil)
            }
        }
    }
    
    //Returns an array of dictionaries, where each dictionary represents a historical event in the web server
    //Returns nil if the web server call does not correctly return data
    //NOTE: Returns data via closure
    func getHistoricalEventList(callback: @escaping (Array<Dictionary<String, AnyObject>>?) -> ()) {
        //Log in
        webLogIn(urlToCall: "http://paulsens-beacon.herokuapp.com/login")
        
        //Call web server to return beacon list
        webCall(urlToCall: "http://paulsens-beacon.herokuapp.com/historical_events.json") { (historicalEventsJson) in
            if let historicalEventList = historicalEventsJson["historical_events"] as? Array<Dictionary<String, AnyObject>>{
                callback(historicalEventList)
            }
            else {
                callback(nil)
            }
        }
    }

    //Returns an array of dictionaries, where each dictionary represents a reward in the promotions table on the web server
    //Returns nil if the web server call does not correctly return data
    //NOTE: Returns data via closure
    func getRewardsList(callback: @escaping (Array<Dictionary<String, AnyObject>>?) -> ()) {
        //Log in
        webLogIn(urlToCall: "http://paulsens-beacon.herokuapp.com/login")
        
        //Call web server to return beacon list
        webCall(urlToCall: "http://paulsens-beacon.herokuapp.com/promotions.json") { (promotionsJson) in
            if let promotionsList = promotionsJson["promotions"] as? Array<Dictionary<String, AnyObject>> {
                var rewardsList = [[String: AnyObject]]()
                for promotion in promotionsList {
                    if(promotion["daily_deal"] as! Bool == false) {
                        rewardsList.append(promotion)
                    }
                }
                callback(rewardsList)
            }
            else {
                callback(nil)
            }
        }
    }

    //Returns an array of dictionaries, where each dictionary represents a daily deal in the promotions table on the web server
    //Returns nil if the web server call does not correctly return data
    //NOTE: Returns data via closure
    func getDailyDealList(callback: @escaping (Array<Dictionary<String, AnyObject>>?) -> ()) {
        //Log in
        webLogIn(urlToCall: "http://paulsens-beacon.herokuapp.com/login")
        
        //Call web server to return beacon list
        webCall(urlToCall: "http://paulsens-beacon.herokuapp.com/promotions.json") { (promotionsJson) in
            if let promotionsList = promotionsJson["promotions"] as? Array<Dictionary<String, AnyObject>> {
                var dailyDealList = [[String: AnyObject]]()
                for promotion in promotionsList {
                    if(promotion["daily_deal"] as! Bool == true) {
                        dailyDealList.append(promotion)
                    }
                }
                callback(dailyDealList)
            }
            else {
                callback(nil)
            }
        }
    }

}













