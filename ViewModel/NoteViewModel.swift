//
//  NoteViewModel.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 18.11.2022.
//

import Foundation

class NoteViewModel {
    
    // MARK: - Properties
    
    
    // MARK: - Initializers
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func addNoteViewModel(cow : CowModel , noteModel : NoteModel){
        LocaleService.shared.addNote(cow: cow, newNote: noteModel)
        
    }
}

