//
//  Constants.swift
//  Herd Tracking
//
//  Created by Narkoz on 9.05.2022.
//

import UIKit



struct Constants {
    struct Alert{
        static let messageThereIsCow = "Eklemek istediğiniz Küpe numarası daha önceden eklenmiş!"
        static let MessageTehereIsCollar = "Eklemek istediğiniz Tasma  numarası daha önceden eklenmiş!"
        static let title = " Uyarı!"
        static let filedToRegister = "Kayıt edilemedi!"
        static let earRing = "Küpe Numarası Boş Bırakılamaz!"
        static let birthOfDate = "Doğum Tarihi Boş Bırakılamaz!"
        static let gender = "Cinsiyet Boş Bırakılamaz!"
        static let successfullUpdate = "Başarı ile güncellendi!"
        static let successful = "Başarı ile kayıt edildi!"
        static let successTitle = "Başarılı!"
        static let inseminationsPerson = "Bu tohumlayıcı daha önce eklenmiş!"
        static let bull = "Bu boğa daha önce eklenmiş!"
        static let personTextField = "Tohumlayıcı adı boş bırakılamaz!"
        static let bullTextField = "Boğa adı boş bırakılamaz!"
        static let inseminationDate = "Tohumlama tarihi boş bırakılamaz!"
    }
    
    
    struct CollectionView{
        static let homeCollectionView = "MenuCollectionViewCell"
        static let cell = "manuCollectionViewCell"
        static let cowCardMenuCollectionView = "CowCardMenuCollectionViewCell"
        static let cowCardMenuCell = "CowCardMenuCollectionViewCell"
    }
    
    struct TableView{
        static let menuTableView = "MenuTableViewCell"
        static let menuCell = "MenuCell"
        static let inseminationsCell = "inseminationsCell"
        static let inseminationsTableView = "AddInseminationsTableViewCell"
        static let showPersonTableViewCell = "PersonCell"
        static let showPersonTableView = "ShowPersonTableViewCell"
        static let showBullTableView = "ShowBullTableViewCell"
        static let showBullTableViewCell = "BullCell"
    }
    
    
    
    struct Arrays{
        static var cowBreedArray = ["Holstein","Simental","Montbeliarde","Jersey","Angus","Hereford","Montofon","Sarole","Limusin"]
        //   var reproductiveStatusArray = ["Buzağı","Boş","Taze","Tohumlanmış","Gebelik Kontrolü","Abort","Kuruda","Kesimlik"]
        // dizi veri tabanına kayıt edilecek ırklar veri tabanından çekilecek
        static var genderArray = ["Dişi","Erkek"]
        
        static let collectionViewItemArray = ["tumHayvanlar","0-60Taze","tohumlanmis","gebelikKontrolu","bos","gebe","yakinGebe","kuruda","sigortali","kesimlik","0-3ayBuzagi","3-12ayDana","duve","erkekler"]
        
        static let cowCardMenuCollectionViewItemArray = ["Genel Bilgiler","Tohumlama Bilgileri","Doğum Bilgileri","Aşı Bilgileri","Not Bilgileri","Diğer Bilgiler"]
        
        static let inseminationsArray = ["Gebe","Boş","Beklemede"]
    }
    
    static var repro = ReproductiveStatus()
    static var tableView = UITableView()
    static var bullName = BullModel()
    static var inseminationPerson = PersonModel()
    static var cowStatus = false 
    
}
