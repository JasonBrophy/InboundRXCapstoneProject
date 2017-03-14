//
//  Notification.swift
//  CoreApplicationPrototype
//
//  InboundRX iOS RFID Beacon Detecting Application
//  https://gitlab.com/InboundRX-Capstone/Paulsens-iOS-App
//
//  (c) 2017 Brett Chafin, Jason Brophy, Luke Kwak, Paul Huynh, Jason Custodio, Cher Moua, Thaddeus Sundin
//
//  You are free to use, copy, modify, and distribute this file, with attribution,
//  under the terms of the MIT license. See "license.txt" for more info.


/*
 Simple model for holding notification information, along with the corresponding Beacon 
*/

import Foundation

class Notification {
    
    
    var Title: String
    var Description: String
    
    var entryMessage: String
    var exitMessage: String?
    
    
    var BeaconID: String?
    
    init(Title: String, Description: String, entryMessage: String, exitMessage: String?, BeaconID: String?) {
        self.Title = Title
        self.Description = Description
        self.entryMessage = entryMessage
        self.exitMessage = exitMessage
        self.BeaconID = BeaconID
        
    }
    
}
