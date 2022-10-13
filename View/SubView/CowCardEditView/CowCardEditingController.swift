//
//  CowCardEditingController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 10.10.2022.
//


import Foundation
import UIKit
import SwiftUI

protocol CloseViewProtocol {
    func closeView()
    func getTextField() -> CowModel
}

class CowCardEditingController : UIView , NibInitializable {
    
    

    // MARK: - Properties
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var earTagEditingTextField: UITextField!
    @IBOutlet weak var cowNameEditingTextField: UITextField!
    @IBOutlet weak var dateOfBirthEditingTextField: UITextField!
    @IBOutlet weak var cowBreedEditingTextFiedl: UITextField!
    @IBOutlet weak var genderEditingTextfield: UITextField!
    
    var delegate:CloseViewProtocol?
    var nibName: String = "CowCardEditingViewScreen"
    var editingCow : CowModel = CowModel()
    let breedPickerView = UIPickerView()
    let genderPickerView = UIPickerView()
    let datePicker = UIDatePicker()

    
      
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
    
    override func layoutSubviews() {
        setTextField()
        createPickerView(textField: genderEditingTextfield, pickerView: genderPickerView)
        createPickerView(textField: cowBreedEditingTextFiedl, pickerView: breedPickerView)
        createDatePicker()
    }
    
    // MARK: - Setup
    
    private func setup(){}
    
    func createPickerView(textField : UITextField , pickerView : UIPickerView){
        textField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        datePicker.preferredDatePickerStyle = .wheels
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(cancelButtonClicked))
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(doneButtonClicked))
        toolbar.setItems([cancelButton,.flexibleSpace() ,doneButton], animated: true)
        dateOfBirthEditingTextField.inputAccessoryView = toolbar
        dateOfBirthEditingTextField.inputView = datePicker
        datePicker.datePickerMode = .date
    }
   
    // MARK: - Actions
    
    @IBAction func saveButton(_ sender: Any) {
        LocaleService.shared.updateCow(cow: (delegate?.getTextField())!, name: cowNameEditingTextField.text!)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        delegateViewFunc()
    }
    
    // MARK: - Methods

    
    func delegateViewFunc () {
        if let delegate = delegate {
            delegate.closeView()
            
        }
    }
    
    func setTextField (){
        if let delegate = delegate {
            editingCow = delegate.getTextField()
        }
        earTagEditingTextField.text = editingCow.earTag
        cowNameEditingTextField.text = editingCow.cowName
        dateOfBirthEditingTextField.text = editingCow.dateOfBirth
        cowBreedEditingTextFiedl.text = editingCow.cowBreed
        genderEditingTextfield.text = editingCow.gender

    }
    
    @objc func doneButtonClicked(){
        
        if let datePickerView = self.datePicker.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.dateOfBirthEditingTextField.text = dateString
            self.dateOfBirthEditingTextField.resignFirstResponder()
        }
    }
    
    @objc func cancelButtonClicked(){
        self.dateOfBirthEditingTextField.resignFirstResponder()
    }
}

extension CowCardEditingController: UIPickerViewDataSource , UIPickerViewDelegate{

    func numberOfComponents(in pickerView: UIPickerView) -> Int {

        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      
        return pickerView == breedPickerView ? Constants.Arrays.cowBreedArray.count : Constants.Arrays.genderArray.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerView == breedPickerView ? Constants.Arrays.cowBreedArray[row] : Constants.Arrays.genderArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == breedPickerView{
            cowBreedEditingTextFiedl.text = Constants.Arrays.cowBreedArray[row]
            cowBreedEditingTextFiedl.resignFirstResponder()
        }else if pickerView == genderPickerView{
            genderEditingTextfield.text = Constants.Arrays.genderArray[row]
            genderEditingTextfield.resignFirstResponder()
        }
        
    }
    
}


