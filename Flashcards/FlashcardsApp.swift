//
//  FlashcardsApp.swift
//  Flashcards
//
//  Created by Alec DeG on 22/11/2026. To have an understanding of Swift.
//

import SwiftUI
import SwiftData

@main
struct FlashcardsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //Creates the database. Stored on disk and not in memory. It can be saved when closed 
        .modelContainer(for: Flashcard.self)
    }
}
