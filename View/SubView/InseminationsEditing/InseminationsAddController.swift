//
//  InseminationsAddController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 15.10.2022.
//

import Foundation
import UIKit

protocol CloseInseminationViewProtocol{
    func closeInseminationView()
    func addInseminationsDelegate () -> CowModel
}

class InseminationsAddController : UIView ,NibInitializable {
    
    
    
    // MARK: - Properties
    
    @IBOutlet weak var inseminationsDateTextField: UITextField!
    @IBOutlet weak var inseminationsBullTextField: UITextField!
    @IBOutlet weak var inseminationsPersonTextField: UITextField!
 
    
    let datePicker = UIDatePicker()
    var nibName: String = "InseminationsAddView"
    var delegate : CloseInseminationViewProtocol?
    var addInseminations : InseminationModel = InseminationModel()
    var cow = CowModel()
    
    
    
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
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(cancelClicked))
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(doneClicked))
        toolbar.setItems([cancelButton , .flexibleSpace() , doneButton], animated: true)
        inseminationsDateTextField.inputAccessoryView = toolbar
        inseminationsDateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        
    }
    
    // MARK: - Actions
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        // burası guard lanacak
        addInseminations.inseminationDate = inseminationsDateTextField.text!
        addInseminations.inseminatedPerson = inseminationsPersonTextField.text!
        addInseminations.inseminationsBullName = inseminationsBullTextField.text!
        addInseminations.inseminationsStatus = InseminationStatus(rawValue: 2)!.name
        if let delegate = delegate {
            LocaleService.shared.addInseminations(cow: delegate.addInseminationsDelegate(), newInsemination: addInseminations)
        }
        
        delegateCloseInseminationsView()
        
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        delegateCloseInseminationsView()
    }
    
    // MARK: - Methods
    
   @objc func cancelClicked(){
       self.inseminationsDateTextField.resignFirstResponder()
    }
    
    @objc func doneClicked(){
        if let datePickerView = self.datePicker.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.inseminationsDateTextField.text = dateString
            self.inseminationsDateTextField.resignFirstResponder()
        }
    }
    
    func delegateCloseInseminationsView(){
        if let delegate = delegate {
            delegate.closeInseminationView()
        }
    }
}

