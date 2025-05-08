//
//  NoteCreateView.swift
//  BookMemory
//
//  Created by 齋藤龍太 on 2025/05/08.
//

import SwiftUI

struct NoteCreateView: View {
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TextField("タイトルを入力", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical, 10)
            
            TextEditor(text: $content)
                .frame(height: 300)
                .border(Color.gray, width: 1)
                .cornerRadius(8)
            
            Button(action: {
                print("ノートが保存されました")
            }) {
                Text("保存")
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
        .navigationTitle("新規ノート")
    }
}

#Preview {
    NoteCreateView()
}

#Preview {
    NoteCreateView()
}
