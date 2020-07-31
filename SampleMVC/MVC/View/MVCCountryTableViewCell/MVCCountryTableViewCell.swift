//
//  MVCCountryTableViewCell.swift
//  SampleMVC
//
//  Created by sakiyamaK on 2020/07/31.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

final class MVCCountryTableViewCell: UITableViewCell {
  
  @IBOutlet private weak var moneyRatioLabel: UILabel!
  @IBOutlet private weak var nameLabel: UILabel!
  @IBOutlet private weak var countryImageView: UIImageView!

  override func prepareForReuse() {
    super.prepareForReuse()
    moneyRatioLabel.text = nil
    nameLabel.text = nil
    countryImageView.image = nil
  }

  func configure(country: MVCCountryModel) {
    moneyRatioLabel.text = country.moneyRatio.description
    nameLabel.text = country.name
    countryImageView.image = UIImage.init(named: country.imageName)

  }
}
