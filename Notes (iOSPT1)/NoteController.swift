//
//  NoteController.swift
//  Notes (iOSPT1)
//
//  Created by Pat on 4/29/19.
//  Copyright © 2019 putergeek. All rights reserved.
//

import Foundation

class NotesController {
    
    init() {
        
        createNote(withText: "Walk the dog!")
        createNote(withText: "Eat Lunch!")
        createNote(withText: "Swift is awesome!!")
    }
    
    
    private(set) var notes: [Note] = []
    
    func createNote(withText text: String) {
        
        let note = Note(text: text)
        
        notes.append(note)
    }
}
