//
//  MVCTableViewController.swift
//  SampleMVC
//
//  Created by sakiyamaK on 2020/07/18.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class MVCTableViewController: UIViewController {

  private let CELL_NIB_NAME = "MVCTableViewCell"
  private let CELL_ID = "MVCTableViewCell"

  @IBOutlet private weak var tableView: UITableView! {
    didSet {
      //storyboardから読み込んだ時点でセルの登録をすませる
      let cellNIB = UINib(nibName: CELL_NIB_NAME, bundle: nil)
      tableView.register(cellNIB, forCellReuseIdentifier: CELL_ID)
      //データを取得するまでviewを消しておく
      tableView.isHidden = true
    }
  }

  //apiから取得したものを保存する
  private var users: [MVCUserModel] = []

  override func viewDidLoad() {
    super.viewDidLoad()

    //apiからユーザデータを取得
    API.shared.getUsers(completion: {[weak self] users in
      //取得したらテーブルをリロード
      self?.users = users
      self?.tableView.reloadData()
      self?.tableView.isHidden = false
    })
  }
}

//private extensionにしてこの中の記述を全部privateにする
private extension MVCTableViewController {
  //アラートを出す処理
  func showAlert(user: MVCUserModel) {
    let alertVC = UIAlertController(title: "select cell", message: user.alertText, preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    self.present(alertVC, animated: true, completion: nil)
  }
}

extension MVCTableViewController: UITableViewDelegate {
  //セルをタッチしたときの処理
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //apiから取得したデータからindexPath番目のインスタンスを取得
    let user = users[indexPath.row]
    //タップしたときのアクションメソッド(今回はアラートを表示
    showAlert(user: user)
  }
}

extension MVCTableViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //indexPathから登録したセルの型にキャストする
    //失敗したらそのままUITableViewCell
    guard
      let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as? MVCTableViewCell
    else {
      //便宜上 UITableViewCellを返してるが本来ここに来ること自体がエラー
      return UITableViewCell()
    }

    //apiから取得したデータからindexPath番目のインスタンスを取得
    let user = users[indexPath.row]

    //cellの表示更新メソッドにモデルのインスタンスを渡す
    cell.configure(user: user)

    return cell
  }
}
