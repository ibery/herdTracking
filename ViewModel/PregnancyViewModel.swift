//
//  PregnancyViewModel.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 11.11.2022.
//

import Foundation
import UIKit

class  PregnancyViewModel{
    
    // MARK: - Properties
    
    
    // MARK: - Initializers
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func addInspection(cow : CowModel , pregnancyModel : PregnancyModel, pregnancyDateTextField : UITextField , pregnancyResultTextField : UITextField){
        var inseminationCount = 0
        guard let pregnancyDate = pregnancyDateTextField.text else {return}
        
//        if pregnancyDate == ""{
//            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.pregnancyDate)
//        }else{
//            guard let pregnancyResult = pregnancyResultTextField.text else {return}
//            if pregnancyResult == "Beklemede"{
//                for i in cow.inseminations{
//                    if i.inseminationsStatus == "Beklemede"{
//                        break
//                    }
//                    inseminationCount += 1
//                }
//                cow.inseminations[inseminationCount].pregnancyList?.inspectionResult = "Beklemede"
//            }else if pregnancyResult == "Başarısız"{
//                for i in cow.inseminations{
//                    if i.inseminationsStatus == "Beklemede" || i.inseminationsStatus == "Başarılı"{
//                        break
//                    }
//                    inseminationCount += 1
//                }
//                cow.inseminations[inseminationCount].pregnancyList?.inspectionResult = "Başarısız"
//            }else if pregnancyResult == "Başarılı"{
//                for i in cow.inseminations{
//                    if i.inseminationsStatus == "Başarılı" || i.inseminationsStatus == "Beklemede"{
//                        break
//                    }
//                    inseminationCount += 1
//                }
//                cow.inseminations[inseminationCount].pregnancyList?.inspectionResult = "Başarılı"
//            }else if pregnancyResult == "Yavru Atma"{
//                for i in cow.inseminations{
//                    if i.inseminationsStatus == "Başarılı"{
//                        break
//                    }
//                    inseminationCount += 1
//                }
//                cow.inseminations[inseminationCount].pregnancyList?.inspectionResult = "Yavru Atma"
//            }
//            cow.inseminations[inseminationCount].pregnancyList?.inspectionDate = pregnancyDate
//        }
       
 //       LocaleService.shared.addPregnancy(insemination : InseminationModel, newPregnancy: pregnancyModel, row: )
    }
    
}




