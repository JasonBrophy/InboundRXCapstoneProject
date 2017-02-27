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
            let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("\n\nDataRecieved:\n")
            print(str!)
            print("\n-----\n")
            
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
        let json = ["user": ["email": "admin@inboundrx.com", "password": "password123"]]
        
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
            let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("\n\nDataRecieved:\n")
            print(str!)
            print("\n-----\n")
            
            // Signal the semaphore
            semaphore.signal()
        }
        // Let the dataTask resume (run the urlsession request, essentially)
        task.resume()
        // Wait on the semaphore within the callback function
        semaphore.wait()
    }

    
    func printBeaconList() {
        // Test logging in
        webLogIn(urlToCall: "http://paulsens-beacon.herokuapp.com/login")
        
        webCall(urlToCall: "http://paulsens-beacon.herokuapp.com/beacons.json") { (response) in
            if let dictionaryArray = response as? Dictionary<String, AnyObject> {
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
    }
}













