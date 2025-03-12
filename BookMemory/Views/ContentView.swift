//
//  ContentView.swift
//  BookMemory
//
//  Created by 齋藤龍太 on 2025/03/09.
//

import SwiftUI

struct ContentView: View {
    
    let buttonTitles = ["ボタン1"]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack {
                    ForEach(0..<50) { index in
                        Text("アイテム,\(index)")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }
                    .padding(.bottom, 80)
                    }
                Button(action: {
//                    ボタンが押された時の処理
                    print("ボタンが押されました")
                }) {
                    Text("+")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.cyan)
                        .cornerRadius(10)
                }
            }
        }
       
    }
}

#Preview {
    ContentView()
}
