//
//  NoteCreateView.swift
//  BookMemory
//
//  Created by 齋藤龍太 on 2025/05/08.
//

import PhotosUI
import SwiftUI

struct NoteCreateView: View {
    @State private var title = ""
    @State private var content = ""
    @Environment(\.modelContext) private var modelContext
    
    // 新規ノートを親に渡すクロージャ
    var onCreate: ((Note) -> Void)?
    
    // 画像選択用のプロパティ
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TextField("タイトルを入力", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical, 10)
            
            TextEditor(text: $content)
                .frame(height: 300)
                .border(Color.gray, width: 1)
                .cornerRadius(8)
            
            // 画像プレビュー
            if let imageData = selectedImageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .cornerRadius(8)
            }
            
            // 画像選択ボタン
            PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                HStack {
                    Image(systemName: "photo")
                    Text("スクショ・画像を追加")
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            }
            .onChange(of: selectedItem) {
                Task {
                    if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
            
            Button(action: {
                let newNote = Note(title: title, content: content, imageData: selectedImageData)
                modelContext.insert(newNote)
                try? modelContext.save()
                onCreate?(newNote)
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
