//
//  InseminationsAddController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 15.10.2022.
//

import Foundation
import UIKit
import RealmSwift

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
    lazy var inseminationViewModel = InseminationViewModel()
    var bullViewModel = BullViewModel()
    var personViewModel = PersonViewModel()
    let bullNamePickerView = UIPickerView()
    let personNamePickerView = UIPickerView()
    
    
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
        createPickerView(textField: inseminationsPersonTextField, pickerView: personNamePickerView)
        createPickerView(textField: inseminationsBullTextField, pickerView: bullNamePickerView)
        if bullViewModel.fetchBull().count == 0 {
            inseminationsBullTextField.isEnabled = false
            inseminationsBullTextField.placeholder = "Anasayfadan Boğa Ekle"
        }else{
            inseminationsBullTextField.text =  bullViewModel.fetchBull()[0].bullName
            inseminationsBullTextField.placeholder = "Boğa Seçiniz"
        }
        if personViewModel.fetchPersonViewModel().count == 0{
            inseminationsPersonTextField.isEnabled = false
            inseminationsPersonTextField.placeholder = "Anasayfadan Tohumlayıcı Ekle"
        }else{
            inseminationsPersonTextField.text = personViewModel.fetchPersonViewModel()[0].inseminatedPersonName
            inseminationsPersonTextField.placeholder = "Tohumlayıcı Seçiniz"
        }
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
    
    private func createPickerView(textField : UITextField , pickerView : UIPickerView){
        textField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    // MARK: - Actions
    
    @IBAction func saveButton(_ sender: UIButton) {
        let addInseminations = InseminationModel()
       
        addInseminations.inseminationDate = inseminationsDateTextField.text!
        addInseminations.inseminationsStatus = InseminationStatus(rawValue: 2)!.name
      
        if inseminationsDateTextField.text == ""{
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.inseminationDate)
        }else{
            if personViewModel.fetchPersonViewModel().count != 0{
                for i in personViewModel.fetchPersonViewModel(){
                    if i.inseminatedPersonName == inseminationsPersonTextField.text{
                        addInseminations.inseminatedPerson = i
                    }
                }
            }
            if bullViewModel.fetchBull().count != 0{
                for i in bullViewModel.fetchBull(){
                    if i.bullName == inseminationsBullTextField.text{
                        addInseminations.inseminationsBullName = i
                    }
                }
            }
            if let delegate = delegate {
                LocaleService.shared.addInseminations(cow: delegate.addInseminationsDelegate(), newInsemination: addInseminations)
            }
            delegateCloseInseminationsView()
            Constants.tableView.reloadData()
            
        }
        
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

extension InseminationsAddController : UIPickerViewDelegate , UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print("insemination count 2 : \(personViewModel.fetchPersonViewModel().count)")
        if pickerView == bullNamePickerView{
            return bullViewModel.fetchBull().count
        }else{
            return personViewModel.fetchPersonViewModel().count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        print("insemination count : \(personViewModel.fetchPersonViewModel().count)")
        
        //        if bullViewModel.fetchBull().count != 0 {
        //            Constants.bullName = bullViewModel.fetchBull()[row]
        //            return pickerView == bullNamePickerView ? bullViewModel.fetchBull()[row].bullName : personViewModel.fetchPersonViewModel()[row].inseminatedPersonName
        //        }
        //        if personViewModel.fetchPersonViewModel().count != 0{
        //            Constants.inseminationPerson = personViewModel.fetchPersonViewModel()[row]
        //            return pickerView == bullNamePickerView ? bullViewModel.fetchBull()[row].bullName : personViewModel.fetchPersonViewModel()[row].inseminatedPersonName
        //        }
        return pickerView == bullNamePickerView ? bullViewModel.fetchBull()[row].bullName : personViewModel.fetchPersonViewModel()[row].inseminatedPersonName
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == bullNamePickerView {
            if let bullname = bullViewModel.fetchBull()[row].bullName{
                inseminationsBullTextField.text =  "\(bullname)"
            }
            Constants.bullName = bullViewModel.fetchBull()[row]
            inseminationsBullTextField.resignFirstResponder()
        }else{
            if let personName = personViewModel.fetchPersonViewModel()[row].inseminatedPersonName{
                inseminationsPersonTextField.text = "\(personName)"
            }
            Constants.inseminationPerson = personViewModel.fetchPersonViewModel()[row]
            inseminationsPersonTextField.resignFirstResponder()
        }
    }
    
    
}

