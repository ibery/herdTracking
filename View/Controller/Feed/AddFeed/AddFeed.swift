//
//  AddFeed.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 8.12.2022.
//

import Foundation
import UIKit

class AddFeed : UIView , NibInitializable {
    
    // MARK: - Properties
    @IBOutlet weak var feedNameTextField: UITextField!
    @IBOutlet weak var amountReceivedTextField: UITextField!
   
    @IBOutlet weak var feedDateTextField: UITextField!
    @IBOutlet weak var dailyUseTextField: UITextField!
    var nibName: String = "AddFeedScreen"
    private let feedViewModel = FeedViewModel()
    private let feedModel = FeedModel()
    var delegate : AddFeedProtocol?
    private var datePicker = UIDatePicker()
    
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
        feedDateTextField.inputAccessoryView = toolbar
        feedDateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    // MARK: - Actions
    @IBAction func saveButton(_ sender: UIButton) {
        
        if feedViewModel.textFieldControl(nameText: feedNameTextField, amountText: amountReceivedTextField, dailyText: dailyUseTextField, dateText: feedDateTextField){
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.emptyFeed)
        }else{
            guard let feedName = feedNameTextField.text else {return}
            guard let amountReceived =  amountReceivedTextField.text else {return}
            guard let doubleAmountReceived = Double (amountReceived) else {return}
            guard let dailyUse = dailyUseTextField.text else {return}
            guard let doubleDailyUse = Double(dailyUse) else {return}
            guard let feedDate = feedDateTextField.text else {return}
            feedModel.feedName = feedName
            feedModel.amountReceived = doubleAmountReceived
            feedModel.dailyUse = doubleDailyUse
            feedModel.feedDate = feedDate
          
            guard let delegate = delegate else {return}
            if feedViewModel.controlFeedName(feedName: feedName){
                UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.feedName)
            }else{
                feedViewModel.addFeedViewModel(feed: feedModel)
                delegate.closeAddFeedView()
            }
        }
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        guard let delegate = delegate else {return}
        delegate.closeAddFeedView()
    }
    
    // MARK: - Methods
    
    @objc func doneButtonClicked(){
        
        if let datePickerView = self.datePicker.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.feedDateTextField.text = dateString
            self.feedDateTextField.resignFirstResponder()
        }
    }
    
    @objc func cancelButtonClicked(){
        self.feedDateTextField.resignFirstResponder()
    }
}


