//
//  Flashcard.swift
//  Flashcards
//
//  Created by Alec DeG on 22/11/2026.
//

import Foundation

//SwiftData lets us write data to the disk. @State writes to the memory which is lost after when closed.
import SwiftData

//Replacing Struct with @Model. @Model give every object it's own unqiue identifier so we don't need id
@Model
class Flashcard{
    //Front of flashcard and back of flashcard. Can be edited hence var as we want users to create their own/edit it.
    var front: String
    var back: String
    var hint: String? // This is an optional. Defaults to nil
    var createdAt = Date()
    
    init(front: String, back: String, hint: String? = nil) {
        self.front = front
        self.back = back
        self.hint = hint
    }
}

extension Flashcard {
    static var examples: [Flashcard] {
        [
            Flashcard(front: "What does Swift prefer more: let or var?", back: "let", hint: "The one which can't change."),
            Flashcard(front: "Struct vs Class.", back: "Structs are value types while Classes are reference types."),
            Flashcard(front: "What does ? after a type mean?", back: "That it is optional",hint: "Does it always appear?"),
            Flashcard(front: "When you flip Card 1, the other cards don't flip. Why does this happen even though we wrote @State once?", back: "Each row built from @State gets it's own copy")
        ]
    }
}

