//
//  VaccineListModel.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 28.10.2022.
//
import RealmSwift

class VaccineListModel: Object {
    @Persisted var vaccineDate : String?
    @Persisted var vaccineName : String?
}

