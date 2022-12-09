//
//  OtherViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 27.10.2022.
//

import UIKit

class OtherViewController : UIView ,NibInitializable {
    
    // MARK: - Properties
    
    @IBOutlet weak var numberOfMilkedLabel: UILabel!
    @IBOutlet weak var lastCalvingLabel: UILabel!
    @IBOutlet weak var numbarOfLactationLabel: UILabel!
    @IBOutlet weak var fatherNameTextField: UITextField!
    @IBOutlet weak var motherEarTagTextField: UITextField!
    @IBOutlet weak var numberOfDaysMilkedTextField: UITextField!
    @IBOutlet weak var lastCalvingDateTextField: UITextField!
    @IBOutlet weak var numberOfLactationTextField: UITextField!
    @IBOutlet weak var insuranceTextField: UITextField!
    @IBOutlet weak var magnetTextField: UITextField!
    var nibName: String = "OtherScreen"
    var delegate : GetCowAndViewProtocol?
    private let updateCow = CowModel()
    private let cowViewModel = CowViewModel()
    private let magnetPicker = UIPickerView()
    private let insurancePicker = UIPickerView()
    
    // MARK: - Initializers
    
    required init?(coder: NSCoder ) {
        
        super.init(coder: coder)
        self.initiliaze(withNibName: self.nibName, self.postInitialize)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initiliaze(withNibName: self.nibName, self.postInitialize)
        
    }
    
    private func postInitialize(_ view: UIView) {}
    
    // MARK: - Setup
    
    override func layoutSubviews() {
        textFieldInfo()
        createPickerView(textField: magnetTextField, pickerView: magnetPicker)
        createPickerView(textField: insuranceTextField, pickerView: insurancePicker)
        guard let delegate = delegate?.getCow() else {return}
        if delegate.gender == "Erkek"{
            numberOfMilkedLabel.isHidden = true
            numberOfDaysMilkedTextField.isHidden = true
            lastCalvingLabel.isHidden = true
            lastCalvingDateTextField.isHidden = true
            numberOfLactationTextField.isHidden = true
            numbarOfLactationLabel.isHidden = true
        }else{
            numberOfMilkedLabel.isHidden = false
            numberOfDaysMilkedTextField.isHidden = false
            lastCalvingLabel.isHidden = false
            lastCalvingDateTextField.isHidden = false
            numberOfLactationTextField.isHidden = false
            numbarOfLactationLabel.isHidden = false
        }
        
    }
    
    private func createPickerView(textField : UITextField , pickerView : UIPickerView){
        textField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
    }

    
    // MARK: - Actions
    
    @IBAction func updateOtherInfromation(_ sender: UIButton) {
        
        guard let delegate = delegate else {return}
        guard let numberOfLactationInt = numberOfLactationTextField.text else {return}
        updateCow.numberOfLactations = Int( numberOfLactationInt)
        if lastCalvingDateTextField.text != ""{
            updateCow.lastCalvingDate = lastCalvingDateTextField.text
        }
        if motherEarTagTextField.text != ""{
            updateCow.motherEarTag = motherEarTagTextField.text
        }
        if fatherNameTextField.text != ""{
            updateCow.fatherName = fatherNameTextField.text
        }
        
        updateCow.magnet = magnetTextField.text
        updateCow.insurance = insuranceTextField.text
        cowViewModel.updateOtherCowInfo(cow: delegate.getCow(), updateCow: updateCow)
        delegate.inseminationToHome()
 
        
    }
    
    // MARK: - Methods
    
    private func setup(){}
    
    private func textFieldInfo(){
        guard let delegate = delegate else {return}
        let otherCow = delegate.getCow()
        
        if let numberOflactation = otherCow.numberOfLactations{
            numberOfLactationTextField.text = "\(numberOflactation)"
        }else{
            numberOfLactationTextField.placeholder = "Laktasyon Sayısı Giriniz"
            numberOfLactationTextField.text = nil
        }
        
        if let lastCalving = otherCow.lastCalvingDate {
            lastCalvingDateTextField.text = lastCalving
            let numberOfDaysMilked = NumberOfDays.dateDayCount(date: lastCalving)
            numberOfDaysMilkedTextField.text = "\(numberOfDaysMilked)"
        }else{
            lastCalvingDateTextField.placeholder = "Son Tohumlama Tarihi"
            numberOfDaysMilkedTextField.placeholder = "Sağılan Gün Sayısı"
            lastCalvingDateTextField.text = nil
            numberOfDaysMilkedTextField.text = nil
        }
        if otherCow.motherEarTag == nil{
            motherEarTagTextField.placeholder = "Anne Küpe Numarası Giriniz"
            motherEarTagTextField.text = nil
        }else{
            motherEarTagTextField.text = otherCow.motherEarTag
        }
        if otherCow.fatherName == nil{
            fatherNameTextField.placeholder = "Baba Adı Giriniz"
            fatherNameTextField.text = nil
        }else{
            fatherNameTextField.text = otherCow.fatherName
        }
        if otherCow.insurance == nil || otherCow.insurance == "Hayır"{
            insuranceTextField.text = "Hayır"
        }else{
            insuranceTextField.text = "Evet"
        }
        if otherCow.magnet == nil || otherCow.magnet == "Hayır"{
            magnetTextField.text = "Hayır"
        }else{
            magnetTextField.text = "Evet"
        }
        lastCalvingDateTextField.isEnabled = false
        numberOfDaysMilkedTextField.isEnabled = false
        
    }
}

extension OtherViewController: UIPickerViewDataSource , UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return MagnetAndInsurance.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return MagnetAndInsurance(rawValue: row)?.name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == magnetPicker {
            magnetTextField.text = MagnetAndInsurance(rawValue: row)?.name
            magnetTextField.resignFirstResponder()
        }else{
            insuranceTextField.text = MagnetAndInsurance(rawValue: row)?.name
            insuranceTextField.resignFirstResponder()
        }
        
        

        
        
    }
    
}
