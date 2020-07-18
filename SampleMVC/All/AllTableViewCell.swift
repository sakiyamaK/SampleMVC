//
//  AllTableViewCell.swift
//  SampleMVC
//
//  Created by sakiyamaK on 2020/07/18.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class AllTableViewCell: UITableViewCell {
  //* セルの中のviewがカプセル化されていない
  //* 外部から好きなように書き換えられることになる
  @IBOutlet weak var userNameLabel: UILabel!
  @IBOutlet weak var atNameLabel: UILabel!
  @IBOutlet weak var userSwitch: UISwitch!

  //セルの再利用時に呼ばれる初期化メソッド
  override func prepareForReuse() {
    super.prepareForReuse()
    userNameLabel.text = nil
    atNameLabel.text = nil
    userSwitch.isOn = false
  }
}
