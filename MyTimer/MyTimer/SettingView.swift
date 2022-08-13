//
//  SettingView.swift
//  MyTimer
//
//  Created by Itou Shingo on 2022/08/14.
//

import SwiftUI

struct SettingView: View {
    
    @AppStorage("timer_value") var timerVale = 10
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("\(timerVale)秒")
                    .font(.largeTitle)
                Spacer()
                Picker(selection: $timerVale) {
                    Text("10")
                        .tag(10)
                    Text("20")
                        .tag(20)
                    Text("30")
                        .tag(30)
                    Text("40")
                        .tag(40)
                    Text("50")
                        .tag(50)
                    Text("60")
                        .tag(60)
                } label: {
                    Text("選択")
                }
                .pickerStyle(.wheel)
                Spacer()
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
