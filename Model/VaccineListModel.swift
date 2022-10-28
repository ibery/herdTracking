//
//  VaccineListModel.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 28.10.2022.
//
import RealmSwift

class VaccineListModel: Object {
    @Persisted var vaccineDate : Date?
    @Persisted var vaccineName : VaccineModel?
}

