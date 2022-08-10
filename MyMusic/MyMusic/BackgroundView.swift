//
//  BackgroundView.swift
//  MyMusic
//
//  Created by Itou Shingo on 2022/08/10.
//

import SwiftUI

struct BackgroundView: View {
    
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .ignoresSafeArea()
            .aspectRatio(contentMode: .fill)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(imageName: "background")
    }
}
