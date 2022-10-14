//
//  Constants.swift
//  Herd Tracking
//
//  Created by Narkoz on 9.05.2022.
//



struct Constants {
    struct Alert{
        static let messageThereIsCow = "Eklemek istediğiniz Küpe numarası daha önceden eklenmiş !"
        static let MessageTehereIsCollar = "Eklemek istediğiniz Tasma  numarası daha önceden eklenmiş !"
        static let title = " Uyarı !"
        static let filedToRegister = "Kayıt edilemedi !"
        static let earRing = "Küpe Numarası Boş Bırakılamaz !"
        static let birthOfDate = "Doğum Tarihi Boş Bırakılamaz !"
        static let gender = "Cinsiyet Boş Bırakılamaz !"
        static let successfullUpdate = "Başarı ile güncellendi !"
        static let successful = "Başarı ile kayıt edildi !"
        static let successTitle = "Başarılı !"
    }
    
    
    struct CollectionView{
        static let homeCollectionView = "MenuCollectionViewCell"
        static let cell = "manuCollectionViewCell"
    }
    
    struct TableView{
        static let menuTableView = "MenuTableViewCell"
        static let cell = "MenuCell"
    }
    
    
    
    struct Arrays{
        static var cowBreedArray = ["Holstein","Simental","Montbeliarde","Jersey","Angus","Hereford","Montofon","Sarole","Limusin"]
        //   var reproductiveStatusArray = ["Buzağı","Boş","Taze","Tohumlanmış","Gebelik Kontrolü","Abort","Kuruda","Kesimlik"]
        // dizi veri tabanına kayıt edilecek ırklar veri tabanından çekilecek
        static var genderArray = ["Dişi","Erkek"]
        
        static let collectionViewItemArray = ["tumHayvanlar","0-60Taze","tohumlanmis","gebelikKontrolu","bos","gebe","yakinGebe","kuruda","sigortali","kesimlik","0-3ayBuzagi","3-12ayDana","duve","erkekler"]
    }
    
}
