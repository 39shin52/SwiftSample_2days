//
//  PHPickerView.swift
//  MyCamera
//
//  Created by Itou Shingo on 2022/09/30.
//

import SwiftUI
import PhotosUI

struct PHPickerView: UIViewControllerRepresentable {
    // フォトライブラリー画面(sheet)の開閉状態を管理
    @Binding var isShowSheet: Bool
    // フォトライブラリーから読み込む写真
    @Binding var captureImage: UIImage?
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: PHPickerView
        
        init(parent: PHPickerView) {
            self.parent = parent
        }
        
        // フォトライブラリーで写真を選択、キャンセルした時に呼ばれる
        // 必ず必要
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            // 最初の一件
            if let result = results.first {
                result.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                    // 写真が取得できたら
                    if let unwrapedImage = image as? UIImage {
                        // 選択された写真を追加する
                        self.parent.captureImage = unwrapedImage
                    } else {
                        print("使用できる写真がありません。")
                    }
                }
                parent.isShowSheet = true
            } else {
                print("選択された写真はありません。")
                parent.isShowSheet = false
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PHPickerView>) -> PHPickerViewController {
        // PHPickerVirwContorlleのカスタマイズ
        var configuration = PHPickerConfiguration()
        
        // 静止画を選択
        configuration.filter = .images
        
        // フォトライブラリーで選択できる枚数を1枚にする
        configuration.selectionLimit = 1
        
        // インスタンス生成
        let picker = PHPickerViewController(configuration: configuration)
        
        // delegate設定
        picker.delegate = context.coordinator
        
        return picker
    }
    
    // viewが更新された時に実行
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: UIViewControllerRepresentableContext<PHPickerView>) {
        //　処理なし
    }
}

