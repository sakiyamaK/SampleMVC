
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
    func getUsers() async -> [MVCUserModel] {
        
        do {
            // 仮想API通信
            // 本来はサーバーから取得する
            // ここではサンプルとしてsampeDataを0.4sec後に受け取っている
            try await Task.sleep(for: .milliseconds(400))
            
            guard
                let data: Data = API.sampleData.data(using: .utf8),
                let users = try? JSONDecoder().decode([MVCUserModel].self, from: data)
            else {
                return []
            }
            
            return users
        } catch {
            // エラーが発生した場合は空の配列を返す
            return []
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
