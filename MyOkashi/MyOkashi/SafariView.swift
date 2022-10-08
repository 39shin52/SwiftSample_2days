//
//  SafariView.swift
//  MyOkashi
//
//  Created by Itou Shingo on 2022/10/09.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    // 表示するホームページのURL受ける関数
    var url: URL
    
    // 表示するViewを生成するときに実行
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    // Viewが更新されてときに実行
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        // 処理なし
    }
}
