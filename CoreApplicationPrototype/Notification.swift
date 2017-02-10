//
//  Notification.swift
//  CoreApplicationPrototype
//
//  Created by Brett Chafin on 2/10/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

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
    
    public func attatchBeacon(BeaconID: String) {
        self.BeaconID = BeaconID
    }
    
    
}
