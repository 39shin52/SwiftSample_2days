//
//  ContentView.swift
//  MyCamera
//
//  Created by Itou Shingo on 2022/08/14.
//

import SwiftUI

struct ContentView: View {
    @State var captureImage: UIImage? = nil
    // 撮影画面(sheet)の開閉状態を管理
    @State var isShowSheet = false
    // シェア画面(sheet)の開閉状態を管理
    // @State var isShowActivity = false
    // フォトライブラリーかカメラかを保持する状態変数
    @State var isPhotolibrary = false
    // 選択画面(ActionSheet)のsheetの開閉状態を管理
    @State var isShowAction = false
    
    var body: some View {
        VStack {
            //            Spacer()
            //
            //            if let unwrapedCaptureImage = captureImage {
            //                // 撮影写真を表示
            //                Image(uiImage: unwrapedCaptureImage)
            //                    .resizable()
            //                    .aspectRatio(contentMode: .fit)
            //            }
            
            Spacer()
            // カメラを起動するボタン
            Button(action: {
                // ボタンをタップした時のアクション
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    print("カメラは利用できます。")
                    isShowSheet = true
                } else {
                    print("カメラは利用できません。")
                }
                isShowAction = true
            }) {
                Text("カメラを起動する")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()
            // UIImagePickerController(写真撮影)を表示
            .sheet(isPresented: $isShowSheet) {
                //                // フォトライブラリーが選択された
                //                if isPhotolibrary {
                //                    PHPickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
                //                } else {
                //                    ImagePickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
                //                }
                
                if let unwrapedCaptureImage = captureImage {
                    // 撮影写真を表示
                    EffectView(isShowSheet: $isShowSheet, captureImage: unwrapedCaptureImage)
                } else {
                    // フォトライブラリーが選択された
                    if isPhotolibrary {
                        PHPickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
                    } else {
                        ImagePickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
                    }
                }
            }
            .actionSheet(isPresented: $isShowAction) {
                // Actionsheetを表示
                ActionSheet(title: Text("確認"), message: Text("選択してください"), buttons: [
                    .default(Text("カメラ"), action: {
                        isPhotolibrary = false
                        if UIImagePickerController.isSourceTypeAvailable(.camera) {
                            print("カメラは利用できます。")
                            isShowSheet = true
                        } else {
                            print("カメラは利用できません。")
                        }
                    }),
                    .default(Text("フォトライブラリー"), action: {
                        isPhotolibrary = true
                        isShowSheet = true
                    }),
                    .cancel(),
                ])
            }
            
            // SNSに投稿するボタン
            //            Button(action: {
            //                // ボタンをタップしたときのアクション
            //                if let _ = captureImage {
            //                    isShowActivity = true
            //                }
            //
            //            }) {
            //                Text("SNSに投稿する")
            //                    .frame(maxWidth: .infinity)
            //                    .frame(height: 50)
            //                    .multilineTextAlignment(.center)
            //                    .background(Color.blue)
            //                    .foregroundColor(Color.white)
            //            }
            //            .padding()
            //            .sheet(isPresented: $isShowActivity) {
            //                ActivityView(shareItems: [captureImage!])
            //            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
