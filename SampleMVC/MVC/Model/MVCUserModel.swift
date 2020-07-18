//
//  MVCUserModel.swift
//  SampleMVC
//
//  Created by sakiyamaK on 2020/07/18.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

struct MVCUserModel: Codable {
  var name: String = ""
  var atName: String = ""
  var isOn: Bool = false

  enum CodingKeys: String, CodingKey {
    case name
    case atName = "at_name"
    case isOn = "switch"
  }

  var alertText: String {
    name + "\n" + atName
  }
}
