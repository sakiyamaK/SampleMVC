//
//  AllViewController.swift
//  SampleMVC
//
//  Created by sakiyamaK on 2020/07/18.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

class AllViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  let users = [
    ["name": "tanaka", "atName": "@tanaka", "switch": false],
    ["name": "suzuki", "atName": "@suzuki", "switch": true],
    ["name": "yoshida", "atName": "@yoshida", "switch": true],
    ["name": "tanaka", "atName": "@tanaka", "switch": false],
    ["name": "suzuki", "atName": "@suzuki", "switch": true],
    ["name": "yoshida", "atName": "@yoshida", "switch": true],
    ["name": "tanaka", "atName": "@tanaka", "switch": false],
    ["name": "suzuki", "atName": "@suzuki", "switch": true],
    ["name": "yoshida", "atName": "@yoshida", "switch": true],
    ["name": "tanaka", "atName": "@tanaka", "switch": false],
    ["name": "suzuki", "atName": "@suzuki", "switch": true],
    ["name": "yoshida", "atName": "@yoshida", "switch": true],
    ["name": "tanaka", "atName": "@tanaka", "switch": false],
    ["name": "suzuki", "atName": "@suzuki", "switch": true],
    ["name": "yoshida", "atName": "@yoshida", "switch": true],
    ["name": "tanaka", "atName": "@tanaka", "switch": false],
    ["name": "suzuki", "atName": "@suzuki", "switch": true],
    ["name": "yoshida", "atName": "@yoshida", "switch": true],
    ["name": "tanaka", "atName": "@tanaka", "switch": false],
    ["name": "suzuki", "atName": "@suzuki", "switch": true],
    ["name": "yoshida", "atName": "@yoshida", "switch": true]
  ]

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let user = users[indexPath.row]

    let alertVC = UIAlertController(title: "select cell", message: "\(user["name"] as! String) \n \(user["atName"] as! String)", preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alertVC, animated: true, completion: nil)
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "AllTableViewCell") as! AllTableViewCell

    let user = users[indexPath.row]

    cell.userNameLabel.text = user["name"] as? String
    cell.atNameLabel.text = user["atName"] as? String
    cell.userSwitch.isOn = user["switch"] as! Bool

    return cell
  }
}
