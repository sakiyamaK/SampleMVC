//
//  MVCCountoryModel.swift
//  SampleMVC
//
//  Created by sakiyamaK on 2020/07/31.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

//CaseIteratableを継承すると全パターンの入った配列を生成するパラメータがつく
enum MVCCountryModel: CaseIterable {
  case america
  case japan
  case china
  case france

  var name: String {
    switch self {
    case .america:
      return "アメリカ"
    case .japan:
      return "日本"
    case .china:
      return "中国"
    case .france:
      return "フランス"
    }
  }

  var imageName: String {
    switch self {
    case .america:
      return "america"
    case .japan:
      return "japan"
    case .china:
      return "china"
    case .france:
      return "france"
    }
  }

  var moneyRatio: Double {
    switch self {
    case .america:
      return 0.01
    case .japan:
      return 1
    case .china:
      return 0.5
    case .france:
      return 0.2
    }
  }
}
