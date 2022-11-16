//
//  PregnancyInspectionViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 16.11.2022.
//

import UIKit

class PregnancyInspectionViewController: BaseViewController {
    @IBOutlet weak var inspectionDateTextField: UITextField!
    
    @IBOutlet weak var inspectionResultTextFiedl: UITextField!
    
    @IBOutlet weak var earTagLabel: UILabel!
    // MARK: - Properties
    var cow = CowModel()
    private var pregnancyModel = PregnancyModel()
    private var inseminationViewModel = InseminationViewModel()
    private var inseminationModel = InseminationModel()
    var row : Int = 0
    private let datePicker = UIDatePicker()
    private let resultPicker = UIPickerView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        earTagLabel.text = cow.earTag
        createDatePicker()
        createPickerView(textField: inspectionResultTextFiedl, pickerView: resultPicker)
        inspectionResultTextFiedl.text = InseminationStatus(rawValue: 0)?.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    
    // MARK: - Setup
    
    func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        datePicker.preferredDatePickerStyle = .wheels
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(cancelButtonClicked))
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(doneButtonClicked))
        toolbar.setItems([cancelButton,.flexibleSpace() ,doneButton], animated: true)
        inspectionDateTextField.inputAccessoryView = toolbar
        inspectionDateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    private func createPickerView(textField : UITextField , pickerView : UIPickerView){
        textField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    // MARK: - Actions
    @IBAction func saveInspection(_ sender: Any) {
        pregnancyModel.inspectionDate = inspectionDateTextField.text
        pregnancyModel.inspectionResult = inspectionResultTextFiedl.text
        
        LocaleService.shared.addPregnancy(cow : cow, newPregnancy: pregnancyModel,row: row)
        
        guard let viewController = Storyboard.home.viewController else {return }
        print("guard let geçti")
        self.navigationController?.show(viewController, sender: nil)
       
        print("view controller geçti")
    }
    
    
    //MARK: - Methods
    
    @objc func doneButtonClicked(){
        
        if let datePickerView = self.datePicker.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.inspectionDateTextField.text = dateString
            self.inspectionDateTextField.resignFirstResponder()
        }
    }
    
    @objc func cancelButtonClicked(){
        self.inspectionDateTextField.resignFirstResponder()
    }
}

extension PregnancyInspectionViewController : UIPickerViewDelegate , UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return InseminationStatus.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return InseminationStatus(rawValue: row)?.name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        inspectionResultTextFiedl.text = InseminationStatus(rawValue: row)?.name
        inspectionResultTextFiedl.resignFirstResponder()
    }
}
