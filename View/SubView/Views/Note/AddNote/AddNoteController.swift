//
//  AddNoteController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 17.11.2022.
//

import Foundation
import UIKit

class AddNoteController : UIView , NibInitializable {
    
    // MARK: - Properties
    @IBOutlet weak var addNoteDateTextField: UITextField!
    @IBOutlet weak var addNoteTextField: UITextField!
    
    private var datePicker = UIDatePicker()
    var nibName: String = "AddNoteScreen"
    var delegate : NoteProtocol?
    
    
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
    func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        datePicker.preferredDatePickerStyle = .wheels
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(cancelButtonClicked))
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(doneButtonClicked))
        toolbar.setItems([cancelButton,.flexibleSpace() ,doneButton], animated: true)
        addNoteDateTextField.inputAccessoryView = toolbar
        addNoteDateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    // MARK: - Actions
    
    @IBAction func saveNote(_ sender: UIButton) {
        let noteModel = NoteModel()
        let noteViewModel = NoteViewModel()
        guard let delegate = delegate else {return}
        noteModel.noteDate = addNoteDateTextField.text
        noteModel.noteName = addNoteTextField.text
        noteViewModel.addNoteViewModel(cow: delegate.noteCow(), noteModel: noteModel)
        delegate.noteHiddenView()
    }
    
    
    // MARK: - Methods
    
    @objc func doneButtonClicked(){
        
        if let datePickerView = self.datePicker.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.addNoteDateTextField.text = dateString
            self.addNoteDateTextField.resignFirstResponder()
        }
    }
    
    @objc func cancelButtonClicked(){
        self.addNoteDateTextField.resignFirstResponder()
    }

}

