//
//  MVCTableViewCell.swift
//  SampleMVC
//
//  Created by sakiyamaK on 2020/07/18.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class MVCTableViewCell: UITableViewCell {
  
  @IBOutlet private weak var userNameLabel: UILabel!
  @IBOutlet private weak var atNameLabel: UILabel!
  @IBOutlet private weak var userSwitch: UISwitch!

  override func prepareForReuse() {
    super.prepareForReuse()
    userNameLabel.text = nil
    atNameLabel.text = nil
    userSwitch.isOn = false
  }

  func configure(user: MVCUserModel) {
    userNameLabel.text = user.name
    atNameLabel.text = user.atName
    userSwitch.isOn = user.isOn
  }
}
