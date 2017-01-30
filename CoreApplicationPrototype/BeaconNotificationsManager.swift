//
// Please report any problems with this app template to contact@estimote.com
//

import UIKit
import UserNotifications

class BeaconNotificationsManager: NSObject, ESTBeaconManagerDelegate {

    private let beaconManager = ESTBeaconManager()

    private var enterMessages = [String: String]()
    private var exitMessages = [String: String]()

    override init() {
        super.init()

        self.beaconManager.delegate = self
        self.beaconManager.requestAlwaysAuthorization()

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) {(accepted, error) in
            if !accepted {
                print("Notification access denied.")
            }
        }
    }

    func enableNotifications(for beaconID: BeaconID, enterMessage: String?, exitMessage: String?) {
        let beaconRegion = beaconID.asBeaconRegion
        self.enterMessages[beaconRegion.identifier] = enterMessage
        self.exitMessages[beaconRegion.identifier] = exitMessage
        self.beaconManager.startMonitoring(for: beaconRegion)
    }

    func beaconManager(_ manager: Any, didEnter region: CLBeaconRegion) {
        if let message = self.enterMessages[region.identifier] {
            self.showNotificationWithMessage(message)
            
            }
        }
    

    func beaconManager(_ manager: Any, didExitRegion region: CLBeaconRegion) {
        if let message = self.exitMessages[region.identifier] {
            self.showNotificationWithMessage(message)
        }
    }

    fileprivate func showNotificationWithMessage(_ message: String) {
        
        let content = UNMutableNotificationContent()
        content.title = "Beacon in Range"
        content.body = message
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 1, repeats: false)
        
        let notification = UNNotificationRequest(identifier: "Entered", content: content, trigger: trigger)
        
        
        //Removes pending Notifications to prevent duplicates
        //UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        UNUserNotificationCenter.current().add(notification) {(error) in
            if let error = error {
                print("Uh oh! We had an error: \(error)")
            }
        }
    }

    func beaconManager(_ manager: Any, didChange status: CLAuthorizationStatus) {
        if status == .denied || status == .restricted {
            NSLog("Location Services are disabled for this app, which means it won't be able to detect beacons.")
        }
    }

    func beaconManager(_ manager: Any, monitoringDidFailFor region: CLBeaconRegion?, withError error: Error) {
        print("Monitoring failed for region: \(region?.identifier ?? "(unknown)"). Make sure that Bluetooth and Location Services are on, and that Location Services are allowed for this app. Beacons require a Bluetooth Low Energy compatible device: <http://www.bluetooth.com/Pages/Bluetooth-Smart-Devices-List.aspx>. Note that the iOS simulator doesn't support Bluetooth at all. The error was: \(error)")
    }

}
