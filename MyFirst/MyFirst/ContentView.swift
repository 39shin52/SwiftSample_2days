//
//  ContentView.swift
//  MyFirst
//
//  Created by Itou Shingo on 2022/08/08.
//

import SwiftUI

struct ContentView: View {
    @State var outputText = "Hello, World!"
    
    var body: some View {
        VStack {
            Text(outputText)
                .padding()
            Button(action: {
                if outputText == "Hi, Swift!" {
                    outputText = "Hello, World!"
                } else {
                    outputText = "Hi, Swift!"

                }
            }) {
                Text("切り替えボタン")
                    .foregroundColor(Color.white)
                    .padding(.all)
                    .background(Color.blue)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
