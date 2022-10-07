//
//  ImagePickerView.swift
//  MyCamera
//
//  Created by Itou Shingo on 2022/08/14.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    // UIImiagePickerController(写真撮影)が表示されているかどうかを管理
    @Binding var isShowSheet: Bool
    // 撮影した写真を格納する変数
    @Binding var captureImage: UIImage?
    
    // Coordnatorでコントローラのdelegetaを管理
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        // ImagePikerView型の定数を用意
        let parent: ImagePickerView
        
        // イニシャライザ
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
        // 撮影が終わった時に呼ばれるdelegateメソッド、必ず必要
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // 撮影した写真をcaputureImageに格納
            if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.captureImage = originalImage
            }
            
            // sheetを閉じない
            parent.isShowSheet = true
        }
        
        // キャンセルボタンが選択されたときに呼ばれる
        
        // delegateメソッド、必ず必要
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            // sheetを閉じる
            parent.isShowSheet = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        // Coordinatorクラスのインスタンスを生成
        Coordinator(self)
    }
    
    // Viewを生成するときに実行
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        // UIImagePickerCpntrollerのインスタンスを生成
        let myImagePickerCpntroller = UIImagePickerController()
        
        // sourceTypeにcameraを追加
        myImagePickerCpntroller.sourceType = .camera
        
        // delegete設定
        myImagePickerCpntroller.delegate = context.coordinator
        
        // UIImagePickerControllerを返す
        return myImagePickerCpntroller
    }
    
    // Viewが更新されたときに実行
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        // 処理なし
    }
}

