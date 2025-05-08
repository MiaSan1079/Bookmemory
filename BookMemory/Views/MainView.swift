//
//  ContentView.swift
//  BookMemory
//
//  Created by 齋藤龍太 on 2025/03/09.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingNoteCreateView = false
    var body: some View {
        NavigationView {
            VStack {
                List(0..<10) { index in
                    NavigationLink(destination: NoteDetailView()) {
                        VStack(alignment: .leading) {
                            Text("ノートタイトル \(index)")
                                .font(.headline)
                            Text("これはノートのプレビューです。")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .lineLimit(2)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 2)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("BookMemory")
                
                Button(action: {
                    // ノート作成画面へ遷移
                    isShowingNoteCreateView = true
                }) {
                    Text("+")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                        .background(Color.blue)
                        .cornerRadius(30)
                        .shadow(radius: 5)
                }
                .padding(.bottom, 20)
                .sheet(isPresented: $isShowingNoteCreateView) {
                    NoteCreateView()
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
