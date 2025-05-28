//
//  ContentView.swift
//  BookMemory
//
//  Created by 齋藤龍太 on 2025/03/09.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var isShowingNoteCreateView = false
    @State private var selectedNote: Note? = nil
    @Query var notes: [Note]

    var body: some View {
        NavigationView {
            VStack {
                List(notes, id: \.id) { note in
                    NavigationLink(destination: NoteDetailView(note: note)) {
                        Text(note.title)
                    }
                }
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
                    NoteCreateView { newNote in
                        // 新規ノートを親に渡すクロージャ
                        selectedNote = newNote
                        isShowingNoteCreateView = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
