//
//  AddCowViewController.swift
//  Herd Tracking
//
//  Created by Narkoz on 21.07.2022.
//

import RealmSwift
import UIKit

class AddCowViewController : BaseViewController {
    
    @IBOutlet var earringNumber: UITextField!
    @IBOutlet var ScrollView: UIScrollView!
    @IBOutlet var leashNumberEditText: UITextField!
    @IBOutlet var dateOfBirth: UITextField!
    @IBOutlet var gender: UITextField!
    @IBOutlet var cowName: UITextField!
    @IBOutlet weak var reproductiveStatus: UITextField!
    @IBOutlet var cowBreed: UITextField!
    @IBOutlet weak var lastCalvingDateTextField: UITextField!
    @IBOutlet weak var lastInseminationDateTextField: UITextField!
    
    
    // MARK: - Properties
    
   private var cowViewModel = CowViewModel()
   private let datePicker = UIDatePicker()
   private lazy var realm = try! Realm()
   private let breedPickerView = UIPickerView()
   private let genderPickerView = UIPickerView()
   private let reproductiveStatusPickerView = UIPickerView()
   private let lastCalvingDatePicker = UIDatePicker()
   private let lastInseminationDatePicker = UIDatePicker()
    
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        createLastCalvingDate()
        createLastInseminationDate()
        createPickerView(textField: gender, pickerView: genderPickerView)
        createPickerView(textField: reproductiveStatus, pickerView: reproductiveStatusPickerView)
        createPickerView(textField: cowBreed, pickerView: breedPickerView)
        gender.text = Constants.Arrays.genderArray[0]
        cowBreed.text = Constants.Arrays.cowBreedArray[0]
        reproductiveStatus.text = ReproductiveStatus(rawValue: 0)!.name
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addSideMenuButton()
    }
    
    // MARK: - Setup
    //   override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    // let userInterFaaceStyle = traitCollection.userInterfaceStyle
    
    //        if userInterFaaceStyle == .dark{
    //            earringNumber.backgroundColor = .lightGray
    //
    //        }else{
    //            earringNumber.backgroundColor = .white
    //        }
    //   }
    
    func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        datePicker.preferredDatePickerStyle = .wheels
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(cancelButtonClicked))
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(doneButtonClicked))
        toolbar.setItems([cancelButton,.flexibleSpace() ,doneButton], animated: true)
        dateOfBirth.inputAccessoryView = toolbar
        dateOfBirth.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    func createLastCalvingDate(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        lastCalvingDatePicker.preferredDatePickerStyle = .wheels
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(lastCalvingCancel))
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(lastCalvingDone))
        toolbar.setItems([cancelButton,.flexibleSpace() ,doneButton], animated: true)
        lastCalvingDateTextField.inputAccessoryView = toolbar
        lastCalvingDateTextField.inputView = lastCalvingDatePicker
        lastCalvingDatePicker.datePickerMode = .date
    }
    
    func createLastInseminationDate(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        lastInseminationDatePicker.preferredDatePickerStyle = .wheels
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(lastInseminationCancel))
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(lastInseminationDone))
        toolbar.setItems([cancelButton,.flexibleSpace() ,doneButton], animated: true)
        lastInseminationDateTextField.inputAccessoryView = toolbar
        lastInseminationDateTextField.inputView = lastInseminationDatePicker
        lastInseminationDatePicker.datePickerMode = .date
    }
    
    private func createPickerView(textField : UITextField , pickerView : UIPickerView){
        textField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
    }

    // MARK: - Actions
    
//    func cowCheckStatus() -> Bool{
//        return cowViewModel.checkIfThereIsCow(cowCheck: createdCow())
//    }
    
    @IBAction func saveCow(_ sender: UIButton) {

    //    cowViewModel.checkIfThereIsCow(cowCheck: createdCow())
        let cowModel = CowModel()
        let inseminationModel = InseminationModel()
        cowModel.earTag = earringNumber.text ?? ""   // guard lanacak
        cowModel.leashNumber = leashNumberEditText.text ?? ""
        cowModel.dateOfBirth = dateOfBirth.text ?? ""
        cowModel.cowName = cowName.text ?? ""
        cowModel.cowBreed = cowBreed.text ?? ""
        cowModel.gender = gender.text ?? ""
        cowModel.reproductiveStatus = Constants.repro
        
        if Constants.repro.name == "Taze"{
            if lastCalvingDateTextField.text == ""{
                UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.lastClavingDate)
            }else{
                cowModel.lastCalvingDate = lastCalvingDateTextField.text
                 cowViewModel.addCowViewModel(cowAdd: cowModel)
                emptyTextFields()
                lastCalvingDateTextField.isHidden = true
            }

        }else if Constants.repro.name == "Tohumlanmış"{
            if lastInseminationDateTextField.text == ""{
                UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.inseminationDate)
            }else{
                cowViewModel.addCowViewModel(cowAdd: cowModel)
                guard let lastInseminationDate = lastInseminationDateTextField.text else {return}
                inseminationModel.inseminationDate = lastInseminationDate
                inseminationModel.inseminationsStatus = "Beklemede"
                LocaleService.shared.addInseminations(cow: cowModel, newInsemination: inseminationModel)
                emptyTextFields()
                lastInseminationDateTextField.isHidden = true
            }

        }else if Constants.repro.name == "Gebe" || Constants.repro.name == "Kuruda" || Constants.repro.name == "Yakın Gebe" {
            if lastInseminationDateTextField.text == ""{
                UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.inseminationDate)
            }else{
                cowViewModel.addCowViewModel(cowAdd: cowModel)
                guard let lastInseminationDate = lastInseminationDateTextField.text else {return}
                inseminationModel.inseminationDate = lastInseminationDate
                inseminationModel.inseminationsStatus = "Başarılı"
                LocaleService.shared.addInseminations(cow: cowModel, newInsemination: inseminationModel)
                emptyTextFields()
                lastInseminationDateTextField.isHidden = true
            }

        }else{
            cowViewModel.addCowViewModel(cowAdd: cowModel)
            emptyTextFields()
        }
  


        // ekleme işlemi başarılı ise alt satırlar yapılacka
        
        
        // Toast mesaj gibi otomatik kapanan mesaj ekelenecek
        
        
    }
    
    //MARK: - Methods
    private func emptyTextFields(){
        if !Constants.cowStatus{
            earringNumber.text = ""
            leashNumberEditText.text = ""
            dateOfBirth.text = ""
            cowName.text = ""
            lastInseminationDateTextField.text = ""
            lastCalvingDateTextField.text = ""
            cowBreed.text = Constants.Arrays.cowBreedArray[0]
            gender.text = Constants.Arrays.genderArray[0]
            reproductiveStatus.text = "\(ReproductiveStatus(rawValue: 0)!.name)"
            
        }
    }
//    func createdCow()-> CowModel{
//        cowModel.earTag = earringNumber.text ?? ""
//        cowModel.leashNumber = leashNumberEditText.text ?? ""
//        cowModel.dateOfBirth = dateOfBirth.text ?? ""
//        cowModel.cowName = cowName.text ?? ""
//        cowModel.cowBreed = cowBreed.text ?? ""
//        cowModel.gender = gender.text ?? ""
//        cowModel.reproductiveStatus = Constants.repro
//        return cowModel
//    }
    
    @objc func doneButtonClicked(){
        
        if let datePickerView = self.datePicker.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.dateOfBirth.text = dateString
            self.dateOfBirth.resignFirstResponder()
        }
    }
    
    @objc func cancelButtonClicked(){
        self.dateOfBirth.resignFirstResponder()
    }
    
    @objc func lastCalvingDone(){
        
        if let datePickerView = self.lastCalvingDatePicker.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.lastCalvingDateTextField.text = dateString
            self.lastCalvingDateTextField.resignFirstResponder()
        }
    }
    
    @objc func lastCalvingCancel(){
        self.lastCalvingDateTextField.resignFirstResponder()
    }
    
    @objc func lastInseminationDone(){
        
        if let datePickerView = self.lastInseminationDatePicker.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.lastInseminationDateTextField.text = dateString
            self.lastInseminationDateTextField.resignFirstResponder()
        }
    }
    
    @objc func lastInseminationCancel(){
        self.lastInseminationDateTextField.resignFirstResponder()
    }
    
}

extension AddCowViewController: UIPickerViewDataSource , UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == breedPickerView{
            return Constants.Arrays.cowBreedArray.count
        }else if pickerView == genderPickerView{
            return Constants.Arrays.genderArray.count
        }else {
            //return reproductiveStatusArray.count
            return ReproductiveStatus.allCases.count
            
        }
        //   return pickerView == breedPickerView ? cowBreedArray.count : genderArray.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == breedPickerView{
            return Constants.Arrays.cowBreedArray[row]
        }else if pickerView == genderPickerView{
            return Constants.Arrays.genderArray[row]
        }else {
            return "\(ReproductiveStatus(rawValue: row)!.name)"
        }
        // return pickerView == breedPickerView ? cowBreedArray[row] : genderArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == breedPickerView{
            cowBreed.text = Constants.Arrays.cowBreedArray[row]
            cowBreed.resignFirstResponder()
        }else if pickerView == genderPickerView{
            gender.text = Constants.Arrays.genderArray[row]
            gender.resignFirstResponder()
            if Constants.Arrays.genderArray[row] == "Erkek"{
                reproductiveStatus.isHidden = true
                
            }else{
                reproductiveStatus.isHidden = false
            }
        }else if pickerView == reproductiveStatusPickerView{
            reproductiveStatus.text = "\(ReproductiveStatus(rawValue: row)!.name)"
            //      cowModel.reproductiveStatus = ReproductiveStatus(rawValue: row)!
            Constants.repro = ReproductiveStatus(rawValue: row)!
            reproductiveStatus.resignFirstResponder()
            if ReproductiveStatus(rawValue: row)?.name == "Taze" {
                lastCalvingDateTextField.isHidden = false
            }else{
                lastCalvingDateTextField.isHidden = true
            }
            if ReproductiveStatus(rawValue: row)?.name == "Tohumlanmış" || ReproductiveStatus(rawValue: row)?.name == "Kuruda" || ReproductiveStatus(rawValue: row)?.name == "Gebe" ||  ReproductiveStatus(rawValue: row)?.name == "Yakın Gebe"{
                lastInseminationDateTextField.isHidden = false
            }else{
                lastInseminationDateTextField.isHidden = true
            }
            
        }
        
    }
    
}



