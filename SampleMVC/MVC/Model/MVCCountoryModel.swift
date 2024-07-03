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
            "アメリカ"
        case .japan:
            "日本"
        case .china:
            "中国"
        case .france:
            "フランス"
        }
    }
    
    var imageName: String {
        switch self {
        case .america:
            "america"
        case .japan:
            "japan"
        case .china:
            "china"
        case .france:
            "france"
        }
    }
    
    var moneyRatio: Double {
        switch self {
        case .america:
            0.01
        case .japan:
            1
        case .china:
            0.5
        case .france:
            0.2
        }
    }
}
