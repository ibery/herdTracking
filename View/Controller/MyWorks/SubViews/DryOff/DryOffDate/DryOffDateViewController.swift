//
//  DryOffDateViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 28.11.2022.
//

import Foundation
import UIKit

class DryOffDateViewController : UIView , NibInitializable {
    
    // MARK: - Properties
    
    @IBOutlet weak var dryOffDateTextField: UITextField!
    var nibName: String = "DryOffDateScreen"
    var delegate : BirthProtocol?
    let cowViewModel = CowViewModel()
    private let datePicker = UIDatePicker()
    
    // MARK: - Initializers
    
    required init?(coder : NSCoder){
        super.init(coder: coder)
        self.initiliaze(withNibName: self.nibName , self.postInitialize)
        setup()
    }
    
    override init (frame: CGRect){
        super.init(frame: frame)
        self.initiliaze(withNibName: self.nibName , self.postInitialize)
    }
    
    private func postInitialize(_ view: UIView){}
    
    override func layoutSubviews() {
        createDatePicker()
    }
    
    // MARK: - Setup
    
    private func setup() {}
    
    private func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        datePicker.preferredDatePickerStyle = .wheels
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(cancelButtonClicked))
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(doneButtonClicked))
        toolbar.setItems([cancelButton , .flexibleSpace() , doneButton], animated: true)
        dryOffDateTextField.inputAccessoryView = toolbar
        dryOffDateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        
    }
    
    // MARK: - Actions
    
    @IBAction func closeButton(_ sender: UIButton) {
        guard let delegate = delegate else {return}
        delegate.closeBirthInfoView()
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        if dryOffDateTextField.text == ""{
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.dryOffDate)
        }else{
            guard let delegate = delegate else {return}
            guard let date = dryOffDateTextField.text else {return}
            cowViewModel.dryOffDate(cow: delegate.fetchCow(), date: date)
            delegate.closeBirthInfoView()
        }
    }
    // MARK: - Methods
    
    @objc private func cancelButtonClicked(){
        self.dryOffDateTextField.resignFirstResponder()
    }
    
    @objc private func doneButtonClicked(){
        if let datePickerView = self.datePicker.inputView as? UIDatePicker{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.dryOffDateTextField.text = dateString
            self.dryOffDateTextField.resignFirstResponder()
        }
    }
}


