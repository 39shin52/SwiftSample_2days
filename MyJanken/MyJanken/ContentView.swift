//
//  ContentView.swift
//  MyJanken
//
//  Created by Itou Shingo on 2022/08/09.
//

import SwiftUI

struct ContentView: View {
    
    @State var answerNumber = 0
    
    var body: some View {
        VStack {
            Spacer()
            if answerNumber == 0 {
                Text("ジャンケンする！")
                    .font(.title)
                    .padding()
                
            } else if answerNumber == 1 {
                Image("gu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Text("グー")
                    .padding(.bottom)
                
            } else if answerNumber == 2 {
                Image("choki")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Text("チョキ")
                    .padding(.bottom)
                
            } else if answerNumber == 3 {
                Image("pa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Text("パー")
                    .padding(.bottom)
                
            }
            
            Button(action: {
                //                    answerNumber = Int.random(in: 1...3)
                var newAnsNumber: Int
                
                repeat {
                    newAnsNumber = Int.random(in: 1...3)
                } while newAnsNumber == answerNumber
                answerNumber = newAnsNumber
            }) {
                Text("ジャンケンをする")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
                    .padding(.bottom)
            }
        }
    }
}

// TODO: 同じ処理を関数化する

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
