//
//  OkashiData.swift
//  MyOkashi
//
//  Created by Itou Shingo on 2022/10/08.
//

import Foundation
import UIKit

struct OkashiItem: Identifiable {
    let id = UUID()
    let name: String
    let link: URL
    let image: URL
}

class OkashiData: ObservableObject {
    // JSONのデータ構造
    struct ResultJson: Codable {
        struct Item: Codable {
            let name: String?
            let url: URL?
            let image: URL?
        }
        let item: [Item]?
    }
    
    // お菓子のリスト(Identifiableプロトコル)
    @Published var okashiList: [OkashiItem] = []
    
    // web API検索用メソッド 第一引数: keyword 検索したいワード
    func searchOkashi(keyword: String) async {
        print(keyword)
        
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        guard let req_url = URL(string:
                                "https://sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        
        print(req_url)
        
        do {
            let (data, _) = try await URLSession.shared.data(from: req_url)
            
            // JsonDecoderのインスタンス取得
            let decoder = JSONDecoder()
            // 受け取ったデータをパースして格納
            let json = try decoder.decode(ResultJson.self, from: data)
            // print(json)
            
            guard let items = json.item else { return }
            
            DispatchQueue.main.async {
                self.okashiList.removeAll()
            }
            
            // 取得しているお菓子だけ処理
            for item in items {
                // お菓子の名称、掲載URL、画像URLをアンラップ
                if let name = item.name, let link = item.url, let image = item.image {
                    // 一つのお菓子を構造体でまとめて管理
                    let okashi = OkashiItem(name: name, link: link, image: image)
                    // @Publishedの変数を更新するときは、メインスレッドで更新する必要がある
                    DispatchQueue.main.async {
                        // お菓子のリストを初期化
                        self.okashiList.append(okashi)
                    }
                }
            }
            print(self.okashiList)
            
        } catch {
            print("エラー発生")
        }
    }
}
