//
//  ViewController.swift
//  MonitoringInternetConnectivity
//
//  Created by Sanjeet Kumar on 23/08/21.
//

import UIKit
import Network

class ViewController: UIViewController {

    @IBOutlet weak var networkStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        monitorNetwork()
    }
    
    func monitorNetwork() {
        let monitor = NWPathMonitor()
        
        monitor.pathUpdateHandler = {
            path in
            if path.status == .satisfied {
                DispatchQueue.main.async {
                    self.networkStatusLabel.text = "Internet connected"
                }
            } else {
                DispatchQueue.main.async {
                    self.networkStatusLabel.text = "No internet"
                }
            }
        }
        
        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
    }


}

