
//
//  api.swift
//  SampleMVC
//
//  Created by sakiyamaK on 2020/07/18.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import Foundation

final class API {
  static let shared = API()
  private init() { }

  func getUsers(completion: (([MVCUserModel]) -> Void)? = nil) {
    //仮想API通信 0.4秒かかる通信みたいな感じ
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
      guard
        let data = API.sampleData.data(using: .utf8),
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
