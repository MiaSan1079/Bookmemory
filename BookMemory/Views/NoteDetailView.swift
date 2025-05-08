//
//  NoteDetailView 2.swift
//  BookMemory
//
//  Created by 齋藤龍太 on 2025/05/08.
//


import SwiftUI

struct NoteDetailView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("ノートタイトル")
                .font(.largeTitle)
                .bold()
            Text("これはノートの内容です。まだデータは設定されていません。")
                .font(.body)
                .foregroundColor(.gray)
            Spacer()
        }
        .padding()
        .navigationTitle("ノートの詳細")
    }
}

#Preview {
    NoteDetailView()
}
