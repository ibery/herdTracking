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
        static let notPregnancy = "Hayvan Gebe Degil!"
        static let successCalfing = "Doğum Başarılı Bir Şekilde Kayıt Edildi!"
        static let calfingBirthDate = "Buzağılama tarihi boş bırakılamaz!"
        static let earTagAndDate = "Küpe numarasını yada tarihi boş bırakmayın!"
        static let lessthanAge = "Bir yaşından Küçük Hayvan Tohumlanamaz!"
        static let pragnent = "Hayvan zaten gebe!"
        static let postpartumOfDay = "Yeni doğum yapan hayvan 20 gün içerisinde tohumlanamaz!"
        static let pregnancyDate = "Muayne tarihi giriniz!"
        static let vaccineDate = "Aşı tarihi giriniz!"
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
        static let birthListTableViewcell = "BirthCell"
        static let birthListTableView = "BirthListTableViewCell"
        static let pregnancyCell = "PregnacyCell"
        static let pregnancyController = "PregnancyTableViewCell"
        static let vaccineCell = "vaccineCell"
        static let vaccineController = "VaccineTableViewCell"
        static let noteCell = "noteCell"
        static let noteController = "NoteTableViewCell"
    }
    
    
    
    struct Arrays{
        static var cowBreedArray = ["Holstein","Simental","Montbeliarde","Jersey","Angus","Hereford","Montofon","Sarole","Limusin"]
        //   var reproductiveStatusArray = ["Buzağı","Boş","Taze","Tohumlanmış","Gebelik Kontrolü","Abort","Kuruda","Kesimlik"]
        // dizi veri tabanına kayıt edilecek ırklar veri tabanından çekilecek
        static var genderArray = ["Dişi","Erkek"]
        
        static let collectionViewItemArray = ["tumHayvanlar","0-60Taze","tohumlanmis","gebelikKontrolu","bos","gebe","yakinGebe","kuruda","sigortali","kesimlik","0-3ayBuzagi","3-12ayDana","duve","erkekler"]
        
        static let cowCardMenuCollectionViewItemArray = ["Genel Bilgiler","Tohumlama Bilgileri","Doğum Bilgileri","Aşı Bilgileri","Not Bilgileri","Diğer Bilgiler"]
        
//        static let inseminationsArray = ["Gebe","Boş","Beklemede"]
    }
    
    static var repro = ReproductiveStatus()
    static var bullName = BullModel()
    static var inseminationPerson = PersonModel()
    static var cowStatus = false
    static var birthCow = CowModel()
    static var inseminationCount = -1
    static var formOfCalving = ""
    static var inspectionTextField = UITextField()
    
    
}
