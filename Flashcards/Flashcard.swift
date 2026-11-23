//
//  Flashcard.swift
//  Flashcards
//
//  Created by Alec DeG on 22/11/2026.
//

import Foundation

struct Flashcard: Identifiable {
    let id = UUID()
    //Front of flashcard and back of flashcard. Can be edited hence var as we want users to create their own/edit it.
    var front: String
    var back: String
    var hint: String? // This is an optional. Defaults to nil
    
}

extension Flashcard {
    static let examples = [
        Flashcard(front: "What does Swift prefer more: let or var?", back: "let", hint: "The one which can't change."),
        Flashcard(front: "Struct vs Class.", back: "Structs are value types while Classes are reference types."),
        Flashcard(front: "What does ? after a type mean?", back: "That it is optional",hint: "Does it always appear?"),
        Flashcard(front: "When you flip Card 1, the other cards don't flip. Why does this happen even though we wrote @State once?", back: "Each row built from @State gets it's own copy")
    ]
}

