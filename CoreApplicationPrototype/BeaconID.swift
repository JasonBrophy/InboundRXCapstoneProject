//
//  BeaconID.swift
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
 Class to hold Beacon information(UUID, major, minor)
*/

struct BeaconID: Equatable, CustomStringConvertible, Hashable {
    
    let proximityUUID: UUID
    let major: CLBeaconMajorValue
    let minor: CLBeaconMinorValue
    
    
    init(proximityUUID: UUID, major: CLBeaconMajorValue, minor: CLBeaconMinorValue) {
        self.proximityUUID = proximityUUID
        self.major = major
        self.minor = minor
        
    }
    
    init(UUIDString: String, major: CLBeaconMajorValue, minor: CLBeaconMinorValue) {
        self.init(proximityUUID: UUID(uuidString: UUIDString)!, major: major, minor: minor)
    }
    
    var asString: String {
        get { return "\(proximityUUID.uuidString):\(major):\(minor)" }
    }
    
    var asBeaconRegion: CLBeaconRegion {
        get { return CLBeaconRegion(
            proximityUUID: self.proximityUUID, major: self.major, minor: self.minor,
            identifier: self.asString) }
    }
    
    var description: String {
        get { return self.asString }
    }
    
    var hashValue: Int {
        get { return self.asString.hashValue }
    }
    
}

func ==(lhs: BeaconID, rhs: BeaconID) -> Bool {
    return lhs.proximityUUID == rhs.proximityUUID
        && lhs.major == rhs.major
        && lhs.minor == rhs.minor
}

extension CLBeacon {
    
    var beaconID: BeaconID {
        get { return BeaconID(
            proximityUUID: proximityUUID,
            major: major.uint16Value,
            minor: minor.uint16Value) }
    }
    
}
