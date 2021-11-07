//
//  MVCUserModel.swift
//  SampleMVC
//
//  Created by sakiyamaK on 2020/07/18.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

//Codableに準拠したモデル
//jsonの文字列からこのstructのインスタンスに簡単に変えられる
struct MVCUserModel: Codable {
    var name: String = ""
    var atName: String = ""
    var isOn: Bool = false
    //jsonのkeyとパラメータの対応付け
    enum CodingKeys: String, CodingKey {
        case name
        case atName = "at_name"
        case isOn = "switch"
    }

    //computed parameter
    var alertText: String {
        name + "\n" + atName
    }
}
