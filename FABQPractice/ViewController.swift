//
//  ViewController.swift
//  FABQPractice
//
//  The aim of this ViewController is to check how Firebase SDK perform
//  when setScreenName is called, setUserID is called.
//
//  Created by 鈴木孝宏 on 2019/08/20.
//  Copyright © 2019 鈴木孝宏. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {

    @IBOutlet weak var userIdTextField: UITextField!
    
    @IBOutlet weak var screenNameTextField: UITextField!
    
    @IBOutlet weak var eventNameTextField: UITextField!

    private let defaultScreenName = "first screen"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Analytics.setScreenName(defaultScreenName, screenClass: nil)
    }

    @IBAction func tapUserIDSendButton(_ sender: Any) {
        guard let userID = userIdTextField.text, !userID.isEmpty else {
            showAlert(with: "userID is set to nil")
            Analytics.setUserID(nil)
            return
        }
        
        Analytics.setUserID(userID)
    }

    @IBAction func tapScreenNameSendButton(_ sender: Any) {
        guard let screenName = screenNameTextField.text, !screenName.isEmpty else {
            showAlert(with: "screenName is set to nil")
            return
        }

        Analytics.setScreenName(screenName, screenClass: nil)
    }

    @IBAction func tapLogEventSendButton(_ sender: Any) {
        guard let eventName = eventNameTextField.text, !eventName.isEmpty else {
            showAlert(with: "please input event name")
            return
        }

        Analytics.logEvent(eventName, parameters: nil)
    }

    private func showAlert(with message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

