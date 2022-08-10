//
//  SoundPlayer.swift
//  MyMusic
//
//  Created by Itou Shingo on 2022/08/10.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
     // 音源読み込み
    let cymbalData = NSDataAsset(name: "cymbalSound")!.data
    let guitarData = NSDataAsset(name: "guitarSound")!.data

    // プレイヤー変数
    var cymbalPlayer: AVAudioPlayer!
    var guitarPlayer: AVAudioPlayer!
    
    
    
     // 音源データを渡す
    func cymbalPlay() {
        do {
            cymbalPlayer = try AVAudioPlayer(data: cymbalData)
            cymbalPlayer.play()
        } catch {
            print("シンバルでエラー発生")
        }
    }
    
    // 音源データを渡す
   func guitarPlay() {
       do {
           guitarPlayer = try AVAudioPlayer(data: guitarData)
           guitarPlayer.play()
       } catch {
           print("ギターでエラー発生")
       }
   }
    
//    func play(data: String) {
//        let dataName = data + "Sound"
//        let playData = NSDataAsset(name: dataName)!.data
//        var player: AVAudioPlayer!
//
//        do {
//            player = try AVAudioPlayer(data: playData)
//            player.play()
//        } catch {
//            print("\(data)でエラー発生")
//        }
//    }
}
