//
//  MVCCountryViewController.swift
//  SampleMVC
//
//  Created by sakiyamaK on 2020/07/31.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class MVCCountryTableViewController: UIViewController {

  private let CELL_NIB_NAME = "MVCCountryTableViewCell"
  private let CELL_ID = "MVCTableViewCell"

  @IBOutlet private weak var tableView: UITableView! {
    didSet {
      //storyboardから読み込んだ時点でセルの登録をすませる
      let cellNIB = UINib(nibName: CELL_NIB_NAME, bundle: nil)
      tableView.register(cellNIB, forCellReuseIdentifier: CELL_ID)
    }
  }

  //予め決まった数のデータソース
  private var countries: [MVCCountryModel] = [.america, .japan, .china, .france]

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.reloadData()
  }
}


extension MVCCountryTableViewController: UITableViewDelegate {
}

extension MVCCountryTableViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return countries.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard
      let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as? MVCCountryTableViewCell
      else {
        return UITableViewCell()
    }

    let country = countries[indexPath.row]

    //cellの表示更新メソッドにモデルのインスタンスを渡す
    cell.configure(country: country)

    return cell
  }
}
