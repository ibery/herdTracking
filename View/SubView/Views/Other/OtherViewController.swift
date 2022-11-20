//
//  OtherViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 27.10.2022.
//

import UIKit

class OtherViewController : UIView ,NibInitializable {
    
    // MARK: - Properties
    
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
        updateCow.lastCalvingDate = lastCalvingDateTextField.text
        updateCow.motherEarTag = motherEarTagTextField.text
        updateCow.fatherName = fatherNameTextField.text
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
            numberOfLactationTextField.text = "-"
        }
        
        if let lastCalving = otherCow.lastCalvingDate {
            lastCalvingDateTextField.text = lastCalving
            let numberOfDaysMilked = NumberOfDays.dateDayCount(date: lastCalving)
            numberOfDaysMilkedTextField.text = "\(numberOfDaysMilked)"
        }else{
            lastCalvingDateTextField.text = "-"
            numberOfDaysMilkedTextField.text = "-"
        }
        if otherCow.motherEarTag == nil{
            motherEarTagTextField.text = "-"
        }else{
            motherEarTagTextField.text = otherCow.motherEarTag
        }
        if otherCow.fatherName == nil{
            fatherNameTextField.text = "-"
        }else{
            fatherNameTextField.text = otherCow.fatherName
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
