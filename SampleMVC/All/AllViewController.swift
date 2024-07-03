//
//  AllViewController.swift
//  SampleMVC
//
//  Created by sakiyamaK on 2020/07/18.
//  Copyright © 2020 sakiyamaK. All rights reserved.
//

import UIKit

//* と書かれているのがダメな理由

//* UITableViewDelegate, UITableViewDataSourceがそのまま記述されてる
//* この中のどれがUITableViewDelegateのメソッドなのか
//* この中のどれがUITableViewDataSourceのメソッドなのか分からない
class AllViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    //* テーブルのデータソースがControllerに記述されている
    //* データがただの配列
    let users = [
        ["name": "tanaka", "atName": "@tanaka", "switch": false],
        ["name": "suzuki", "atName": "@suzuki", "switch": true],
        ["name": "yoshida", "atName": "@yoshida", "switch": true],
        ["name": "tanaka", "atName": "@tanaka", "switch": false],
        ["name": "suzuki", "atName": "@suzuki", "switch": true],
        ["name": "yoshida", "atName": "@yoshida", "switch": true],
        ["name": "tanaka", "atName": "@tanaka", "switch": false],
        ["name": "suzuki", "atName": "@suzuki", "switch": true],
        ["name": "yoshida", "atName": "@yoshida", "switch": true],
        ["name": "tanaka", "atName": "@tanaka", "switch": false],
        ["name": "suzuki", "atName": "@suzuki", "switch": true],
        ["name": "yoshida", "atName": "@yoshida", "switch": true],
        ["name": "tanaka", "atName": "@tanaka", "switch": false],
        ["name": "suzuki", "atName": "@suzuki", "switch": true],
        ["name": "yoshida", "atName": "@yoshida", "switch": true],
        ["name": "tanaka", "atName": "@tanaka", "switch": false],
        ["name": "suzuki", "atName": "@suzuki", "switch": true],
        ["name": "yoshida", "atName": "@yoshida", "switch": true],
        ["name": "tanaka", "atName": "@tanaka", "switch": false],
        ["name": "suzuki", "atName": "@suzuki", "switch": true],
        ["name": "yoshida", "atName": "@yoshida", "switch": true],
        ["name": "suzuki", "atName": "@suzuki", "switch": true],
    ]

    //* テーブルのセルの登録がstoryboadでやっている
    //* セルの種類の追加や変更に対処できない
    
    //テーブルをタップしたときの処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //indexPathからデータを取得
        let user = users[indexPath.row]
        
        //* データソース(辞書型)からkeyを指定して必要なmessageを記述してる
        //* これだと文字列keyの打ち間違いがおきる
        //* 他でも使い回す時に毎回同じことを書く必要がある
        //* モデルから生成するメッセージはモデルの中で用意すべき
        
        //* セルをタップしたときのアクションが複雑になると切り替えが難しい
        //* このあたりの記述自体をメソッド化しておくべき
                        
        let alertVC = UIAlertController(
            title: "select cell",
            message: "\(user["name"] as! String) \n \(user["atName"] as! String)",
            preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
            
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        //* テーブルセルのIDが文字列で記述されてる
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllTableViewCell") as! AllTableViewCell
        
        let user = users[indexPath.row]
        
        //* データソース(辞書型)からkeyを指定している
        //* 文字列の打ち間違いが起きる
        //* セルの中身を直接ViewControllerで更新している
        cell.userNameLabel.text = user["name"] as? String
        cell.atNameLabel.text = user["atName"] as? String
        cell.userSwitch.isOn = user["switch"] as! Bool
                                
        return cell
    }
}
