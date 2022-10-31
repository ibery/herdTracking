//
//  NoteModel.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 28.10.2022.
//

import RealmSwift

class NoteModel : Object {
    
    @Persisted var noteDate : String?
    @Persisted var noteName : String?

}
