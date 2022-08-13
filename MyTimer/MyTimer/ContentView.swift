//
//  ContentView.swift
//  MyTimer
//
//  Created by Itou Shingo on 2022/08/13.
//

import SwiftUI

struct ContentView: View {
    
    @State var timerHandler: Timer?
    @State var count = 0
    @State var showAlert = false
    @AppStorage("timer_value") var timerValue = 10
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundTimer")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                VStack(spacing: 30.0) {
                    Text("残り\(timerValue - count)秒")
                        .font(.largeTitle)
                    HStack {
                        Button(action: {
                            startTimer()
                        }) {
                            Text("スタート")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("startColor"))
                                .clipShape(Circle())
                        }
                        Button(action: {
                            if let unwrapedTimerHandler = timerHandler {
                                if unwrapedTimerHandler.isValid {
                                    unwrapedTimerHandler.invalidate()
                                }
                            }
                        }) {
                            Text("ストップ")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140, height: 140)
                                .background(Color("stopColor"))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .onAppear {
                count = 0
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingView()) {
                        Text("秒数設定")
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("終了"),
                      message: Text("タイマー終了時間です"),
                      dismissButton: .default(Text("OK")))
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func countDownTimer() {
        count += 1
        if timerValue - count <= 0 {
            timerHandler?.invalidate()
        }
    }
    
    func startTimer() {
        if let unwrapedTimerHandler = timerHandler {
            if unwrapedTimerHandler.isValid {
                return
            }
        }
        
        if timerValue - count <= 0 {
            count = 0
        }
        
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            countDownTimer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
