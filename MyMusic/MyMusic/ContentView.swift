//
//  ContentView.swift
//  MyMusic
//
//  Created by Itou Shingo on 2022/08/10.
//

import SwiftUI

struct ContentView: View {
    let soundPlayer = SoundPlayer()
    
    var body: some View {
        ZStack {
            BackgroundView(imageName: "background")
            
            HStack {
                Button(action: {
                    soundPlayer.cymbalPlay()
                }) {
                    Image("cymbal")
                }
                
                Button(action: {
                    soundPlayer.guitarPlay()
                }) {
                    Image("guitar")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
