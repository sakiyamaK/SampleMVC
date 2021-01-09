
//
//  api.swift
//  SampleMVC
//
//  Created by sakiyamaK on 2020/07/18.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

final class API {
  //シングルトンパターンの書き方
  static let shared = API()
  private init() { }

  //userデータを取得するAPI
  func getUsers(completion: (([MVCUserModel]) -> Void)? = nil) {
    //仮想API通信
    //本来はサーバーから取得する
    //ここではサンプルとしてsampeDataを0.4sec後に受け取っている
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {

      guard
        let data = API.sampleData.data(using: .utf8),
        //Codable(Decodable)に準拠したモデルはjson文字列から自動で変わる
        let users = try? JSONDecoder().decode([MVCUserModel].self, from: data)
        else {
          completion?([])
          return
      }
      completion?(users)
    }
  }

  //サーバーからこんな感じでデータが返ってくるとする
  private static var sampleData: String {
    let json =
"""
[
    {
        "name": "tanaka",
        "at_name": "@tanaka",
        "switch": false
    },
    {
        "name": "suzuki",
        "at_name": "@suzuki",
        "switch": true
    },
    {
        "name": "yoshida",
        "at_name": "@yoshida",
        "switch": true
    },
    {
        "name": "tanaka",
        "at_name": "@tanaka",
        "switch": false
    },
    {
        "name": "suzuki",
        "at_name": "@suzuki",
        "switch": true
    },
    {
        "name": "yoshida",
        "at_name": "@yoshida",
        "switch": true
    },
    {
        "name": "tanaka",
        "at_name": "@tanaka",
        "switch": false
    },
    {
        "name": "suzuki",
        "at_name": "@suzuki",
        "switch": true
    },
    {
        "name": "yoshida",
        "at_name": "@yoshida",
        "switch": true
    },
    {
        "name": "tanaka",
        "at_name": "@tanaka",
        "switch": false
    },
    {
        "name": "suzuki",
        "at_name": "@suzuki",
        "switch": true
    },
    {
        "name": "yoshida",
        "at_name": "@yoshida",
        "switch": true
    },
    {
        "name": "tanaka",
        "at_name": "@tanaka",
        "switch": false
    },
    {
        "name": "suzuki",
        "at_name": "@suzuki",
        "switch": true
    },
    {
        "name": "yoshida",
        "at_name": "@yoshida",
        "switch": true
    },
    {
        "name": "tanaka",
        "at_name": "@tanaka",
        "switch": false
    },
    {
        "name": "suzuki",
        "at_name": "@suzuki",
        "switch": true
    },
    {
        "name": "yoshida",
        "at_name": "@yoshida",
        "switch": true
    },
    {
        "name": "tanaka",
        "at_name": "@tanaka",
        "switch": false
    },
    {
        "name": "suzuki",
        "at_name": "@suzuki",
        "switch": true
    },
    {
        "name": "yoshida",
        "at_name": "@yoshida",
        "switch": true
    }
]
"""
    return json
  }
}
