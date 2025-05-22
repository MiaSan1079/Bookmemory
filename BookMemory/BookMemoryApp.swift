//
//  BookMemoryApp.swift
//  BookMemory
//
//  Created by 齋藤龍太 on 2025/03/09.
//

import SwiftUI
import SwiftData

@main
struct BookMemoryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Note.self)
    }
}
