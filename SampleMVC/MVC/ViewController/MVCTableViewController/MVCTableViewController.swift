//
//  MVCTableViewController.swift
//  SampleMVC
//
//  Created by sakiyamaK on 2020/07/18.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class MVCTableViewController: UIViewController {

  let CELL_NIB_NAME = "MVCTableViewCell"
  let CELL_ID = "MVCTableViewCell"

  @IBOutlet private weak var tableView: UITableView! {
    didSet {
      let cellNIB = UINib(nibName: CELL_NIB_NAME, bundle: nil)
      tableView.register(cellNIB, forCellReuseIdentifier: CELL_ID)
      tableView.isHidden = true
    }
  }

  private var users: [MVCUserModel] = []

  override func viewDidLoad() {
    super.viewDidLoad()

    API.shared.getUsers(completion: {[weak self] users in
      self?.users = users
      self?.tableView.reloadData()
      self?.tableView.isHidden = false
    })
  }
}

private extension MVCTableViewController {
  func showAlert(user: MVCUserModel) {
    let alertVC = UIAlertController(title: "select cell", message: user.alertText, preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alertVC, animated: true, completion: nil)
  }
}

extension MVCTableViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let user = users[indexPath.row]
    showAlert(user: user)
  }
}

extension MVCTableViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard
      let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as? MVCTableViewCell
    else {
      return UITableViewCell()
    }

    let user = users[indexPath.row]

    cell.configure(user: user)

    return cell
  }
}
