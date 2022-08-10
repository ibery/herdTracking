//
//  AddCowViewController.swift
//  Herd Tracking
//
//  Created by Narkoz on 21.07.2022.
//

import UIKit

class AddCowViewController : BaseViewController {
    
    @IBOutlet var earringNumber: UITextField!
    @IBOutlet var ScrollView: UIScrollView!
    @IBOutlet var leashNumberEditText: UITextField!
    @IBOutlet var dateOfBirth: UITextField!
    @IBOutlet var gender: UITextField!
    @IBOutlet var cowName: UITextField!
    @IBOutlet var groupNo: UITextField!
    @IBOutlet var cowBreed: UITextField!
  
   

    
    // MARK: - Properties
    var cowViewModel = CowViewModel()
    var cowModel = CowModel()
    let datePicker = UIDatePicker()
    var cowBreedArray = ["Holstein","Simental","Montbeliarde","Jersey","Angus","Hereford","Montofon","Sarole","Limusin"]
    var genderArray = ["Dişi","Erkek"]
    let breedPickerView = UIPickerView()
    let genderPickerView = UIPickerView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        createBreeedPickerView()
        createGenderPickerView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Setup
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
       // let userInterFaaceStyle = traitCollection.userInterfaceStyle
        
        //        if userInterFaaceStyle == .dark{
        //            earringNumber.backgroundColor = .lightGray
        //
        //        }else{
        //            earringNumber.backgroundColor = .white
        //        }
    }
    
    func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        datePicker.preferredDatePickerStyle = .wheels
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(doneButtonClicked))
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(cancelButtonClicked))
        toolbar.setItems([doneButton,.flexibleSpace() ,cancelButton], animated: true)
        dateOfBirth.inputAccessoryView = toolbar
        dateOfBirth.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    func createBreeedPickerView(){
        cowBreed.inputView = breedPickerView
        breedPickerView.delegate = self
        breedPickerView.dataSource = self
    }
    
    func createGenderPickerView(){
        gender.inputView = genderPickerView
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        
    }
    
    // MARK: - Actions

    @IBAction func saveCow(_ sender: UIButton) {
        
        cowViewModel.cowTextFieldControl(cow: <#T##CowModel#>)
    }
    
    
    //MARK: - Methods
    

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
    
    
}

extension AddCowViewController: UIPickerViewDataSource , UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerView == breedPickerView ? cowBreedArray.count : genderArray.count
       
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerView == breedPickerView ? cowBreedArray[row] : genderArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        if pickerView == breedPickerView{
            cowBreed.text = cowBreedArray[row]
            cowBreed.resignFirstResponder()
        }else{
            gender.text = genderArray[row]
            gender.resignFirstResponder()
        }
        
    }
    
    
}


