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
    @IBOutlet var genderControl: UISegmentedControl!
    @IBOutlet var cowName: UITextField!
    @IBOutlet var groupNo: UITextField!
    @IBOutlet var breedPicker: UIPickerView!
    
    
    // MARK: - Properties
    var cowModel = CowModel()
    let datePicker = UIDatePicker()
    var cowGender = "dişi"
    var cowBreedArray = ["Holstein","Simental","Montbeliarde","Jersey","Angus","Hereford","Montofon","Sarole","Limusin"]
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        breedPicker.delegate = self
        breedPicker.dataSource = self
        
       datePicker.preferredDatePickerStyle = .wheels
       createDatePicker()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    
    // MARK: - Setup
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let userInterFaaceStyle = traitCollection.userInterfaceStyle

//        if userInterFaaceStyle == .dark{
//            earringNumber.backgroundColor = .lightGray
//
//        }else{
//            earringNumber.backgroundColor = .white
//        }
    }
    
    // MARK: - Actions
    @IBAction func genderControlTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            cowGender = "dişi"
            print(cowGender)
        case 1:
            cowGender = "erkek"
            print(cowGender)
        default:
            cowGender = "dişi"
            print(cowGender)
        }
    }
    
    
    //MARK: - Methods
    
    func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(doneButtonClicked))
      
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(cancelButtonClicked))
   
        toolbar.setItems([doneButton,.flexibleSpace() ,cancelButton], animated: true)
        
        dateOfBirth.inputAccessoryView = toolbar
        dateOfBirth.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    
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

extension AddCowViewController :  UIPickerViewDelegate{
    
}

extension AddCowViewController : UIPickerViewDataSource {
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
        return cowBreedArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cowModel.cowBreed = cowBreedArray[row]
        print(cowModel.cowBreed)
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cowBreedArray[row]
    }
    
    
}
