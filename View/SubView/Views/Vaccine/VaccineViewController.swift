//
//  VaccineViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 27.10.2022.
//

import Foundation
import UIKit


class VaccineViewController : UIView ,NibInitializable {
    
    // MARK: - Properties
    @IBOutlet weak var vaccineDateTextField: UITextField!
    @IBOutlet weak var vaccineNameTextField: UITextField!
    
    @IBOutlet weak var vaccineTableView: UITableView!
    
    
    var nibName: String = "VaccineScreen"
    var delegate : VaccineProtocol?
    private let vaccineViewModel = VaccineViewModel()
    private let vaccineModel = VaccineModel()
    private var pickerView = UIPickerView()
    private var datePicker = UIDatePicker()
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
        vaccineTableView.delegate = self
        vaccineTableView.dataSource = self
        createDatePicker()
        createPickerView(textField: vaccineNameTextField, pickerView: pickerView)
        vaccineNameTextField.text = Vaccine(rawValue: 0)?.name
        self.vaccineTableView.register(UINib(nibName: Constants.TableView.vaccineController, bundle: nil), forCellReuseIdentifier: Constants.TableView.vaccineCell)
    }
    
    func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        datePicker.preferredDatePickerStyle = .wheels
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(cancelButtonClicked))
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(doneButtonClicked))
        toolbar.setItems([cancelButton,.flexibleSpace() ,doneButton], animated: true)
        vaccineDateTextField.inputAccessoryView = toolbar
        vaccineDateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    private func createPickerView(textField : UITextField , pickerView : UIPickerView){
        textField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    // MARK: - Actions
    @IBAction func vaccineSave(_ sender: Any) {
        guard let delegate = delegate else {return}
        guard let vaccineText = vaccineNameTextField.text else {return}
        vaccineModel.vaccineName = vaccineText
        vaccineModel.vaccineDate = vaccineDateTextField.text
        if vaccineDateTextField.text == ""{
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.vaccineDate)
        }else{
            vaccineViewModel.addVaccineViewModel(cow: delegate.vaccineCow(), vaccineModel: vaccineModel)
            delegate.toHome()
            
        }
    }
    
    
    // MARK: - Methods
    
    private func setup(){}
    
    @objc func doneButtonClicked(){
        
        if let datePickerView = self.datePicker.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.vaccineDateTextField.text = dateString
            self.vaccineDateTextField.resignFirstResponder()
        }
    }
    
    @objc func cancelButtonClicked(){
        self.vaccineDateTextField.resignFirstResponder()
    }
}

extension VaccineViewController : UITableViewDataSource ,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let delegate = delegate else {return 0}
        return delegate.vaccineCow().vaccineList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.vaccineCell, for: indexPath) as? VaccineTableViewCell else {return UITableViewCell()}
        guard let delegate = delegate else {return cell}
        
        cell.vaccineDateLabel.text = delegate.vaccineCow().vaccineList[indexPath.row].vaccineDate
        cell.vaccineNameLabel.text = delegate.vaccineCow().vaccineList[indexPath.row].vaccineName
        return cell
    }
    
}

extension VaccineViewController : UIPickerViewDataSource , UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return Vaccine.allCases.count
        }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Vaccine(rawValue: row)?.name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            vaccineNameTextField.text = Vaccine(rawValue: row)?.name
            vaccineNameTextField.resignFirstResponder()
        }
        
    
}
