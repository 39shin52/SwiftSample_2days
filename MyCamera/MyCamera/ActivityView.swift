//
//  ActivityView.swift
//  MyCamera
//
//  Created by Itou Shingo on 2022/09/30.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    // UIActivityViewController(シェア機能)でシェアする写真
    let shareItems: [Any]
    
    // view生成
    func makeUIViewController(context: Context) -> UIActivityViewController{
        let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        
        return controller
    }
    
    // viewが更新されたときに実行
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>) {
        // 処理なし
    }
}
