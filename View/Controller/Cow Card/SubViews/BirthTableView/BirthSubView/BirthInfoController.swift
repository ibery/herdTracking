//
//  BirthInfoController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 29.10.2022.
//

import Foundation
import UIKit

class BirthInfoController : UIView , NibInitializable {
    
    // MARK: - Properties
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var formOfCalvingTextField
    : UITextField!
    @IBOutlet weak var calfEarTagTextField: UITextField!
    @IBOutlet weak var calfNameTextField: UITextField!
    @IBOutlet weak var calfGenderTextFiedl: UITextField!
    @IBOutlet weak var secondCalfEarTagTextField: UITextField!
    @IBOutlet weak var secondCalfNameTextField: UITextField!
    @IBOutlet weak var secondCalfGenderTextField: UITextField!
    @IBOutlet weak var twinsSwitch: UISwitch!
    @IBOutlet weak var secondCalfLabel: UILabel!
    @IBOutlet weak var twinsLabel: UILabel!
    @IBOutlet weak var calfInfoLabel: UILabel!
    
    var nibName: String = "BirthInfoScreen"
    var delegate :BirthProtocol?
    private let datePicker = UIDatePicker()
    private let formOfCalvingPickerView = UIPickerView()
    private let firstCalfGenderPickerView = UIPickerView()
    private let secondCalfGenderPickerView = UIPickerView()
    private let birthViewModel = BirthViewModel()
    private let calfCow = CowModel()
    private let secondCalf = CowModel()
    private let birthModel = BirthModel()
    
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
        
   //     guard let delegate = delegate else {return}
        
        createDatePicker()
        createPickerView(textField: formOfCalvingTextField , pickerView: formOfCalvingPickerView)
        createPickerView(textField: calfGenderTextFiedl, pickerView: firstCalfGenderPickerView)
        createPickerView(textField: secondCalfGenderTextField, pickerView: secondCalfGenderPickerView)

        formOfCalvingTextField.text = FormOfCalving(rawValue: 0)?.name
        calfGenderTextFiedl.text = Gender(rawValue: 0)?.name
        secondCalfGenderTextField.text = Gender(rawValue: 0)?.name

        
    }
   
    private func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        datePicker.preferredDatePickerStyle = .wheels
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(cancelButtonClicked))
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(doneButtonClicked))
        toolbar.setItems([cancelButton , .flexibleSpace() , doneButton], animated: true)
        birthDateTextField.inputAccessoryView = toolbar
        birthDateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        
    }
    
    private func createPickerView(textField : UITextField , pickerView : UIPickerView){
        textField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    
    
    // MARK: - Actions
    
    
    @IBAction func twinsControlSwitch(_ sender: Any) {
        if twinsSwitch.isOn{
            secondCalfEarTagTextField.isHidden = false
            secondCalfNameTextField.isHidden = false
            secondCalfGenderTextField.isHidden = false
            secondCalfLabel.isHidden = false
        }else{
            secondCalfEarTagTextField.isHidden = true
            secondCalfNameTextField.isHidden = true
            secondCalfGenderTextField.isHidden = true
            secondCalfLabel.isHidden = true
        }
    }
    
    @IBAction func birthSave(_ sender: Any) {
        
        guard let delegate = delegate?.fetchCow() else {return}
        let cow = delegate
        
        birthModel.birthDate = birthDateTextField.text
        birthModel.calfOneEarTag = calfEarTagTextField.text
        birthModel.oneCalfGender = calfGenderTextFiedl.text
        birthModel.calfTwoEarTag = secondCalfEarTagTextField.text
        birthModel.twoCalfGender = secondCalfGenderTextField.text
        
        birthViewModel.giveBirth(cow: cow, calfEarTagTextField: calfEarTagTextField, calfNameTextField: calfNameTextField, calfGenderTextField: calfGenderTextFiedl, formOfCalvingTextFiedl: formOfCalvingTextField, birthDateTextFiedl: birthDateTextField, twinsSwitch: twinsSwitch, secondCalfEarTagTextFiedl: secondCalfEarTagTextField, secondCalfNameTextField: secondCalfNameTextField, secondGenderTextField: secondCalfGenderTextField, calfCow: calfCow, calfingDate: birthDateTextField, secondCalfCow: secondCalf, newBirth: birthModel , view : self)
        closeView()

    }
    @IBAction func CancelButton(_ sender: UIButton) {
        
        closeView()
    }
    
    // MARK: - Methods
    
    private func setup(){}
    
    func closeView(){
        guard let delegate = delegate else {return}
        delegate.closeBirthInfoView()
     
    }
    
    @objc private func cancelButtonClicked(){
        self.birthDateTextField.resignFirstResponder()
    }
    
    @objc private func doneButtonClicked(){
        if let datePickerView = self.datePicker.inputView as? UIDatePicker{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.birthDateTextField.text = dateString
            self.birthDateTextField.resignFirstResponder()
        }
    }
    
}

extension BirthInfoController : UIPickerViewDataSource ,UIPickerViewDelegate{
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerView == formOfCalvingPickerView ? FormOfCalving.allCases.count : Gender.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == formOfCalvingPickerView{
            return FormOfCalving(rawValue: row)!.name
        }else if pickerView == firstCalfGenderPickerView {
            return Gender(rawValue: row)!.name
            
        }else{
            return Gender(rawValue: row)!.name
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == formOfCalvingPickerView{
            formOfCalvingTextField.text = FormOfCalving(rawValue: row)!.name
            if FormOfCalving(rawValue: 1) == FormOfCalving(rawValue: row) || FormOfCalving(rawValue: 2) == FormOfCalving(rawValue: row){
                calfEarTagTextField.isHidden = true
                calfNameTextField.isHidden = true
                calfGenderTextFiedl.isHidden = true
                twinsLabel.isHidden = true
                twinsSwitch.isHidden = true
                calfInfoLabel.isHidden = true
                secondCalfLabel.isHidden = true
                if twinsSwitch.isOn {
                    secondCalfEarTagTextField.isHidden = true
                    secondCalfNameTextField.isHidden = true
                    secondCalfGenderTextField.isHidden = true
                    twinsSwitch.setOn(false, animated: true)
                }

            }else{
                calfEarTagTextField.isHidden = false
                calfNameTextField.isHidden = false
                calfGenderTextFiedl.isHidden = false
                twinsLabel.isHidden = false
                twinsSwitch.isHidden = false
                calfInfoLabel.isHidden = false
            }

            formOfCalvingTextField.resignFirstResponder()
        }else if pickerView == firstCalfGenderPickerView{
            calfGenderTextFiedl.text = "\(Gender(rawValue: row)!.name)"
            calfGenderTextFiedl.resignFirstResponder()
        }else{
            secondCalfGenderTextField.text = "\(Gender(rawValue: row)!.name)"
            secondCalfGenderTextField.resignFirstResponder()
        }
        
    }
}

