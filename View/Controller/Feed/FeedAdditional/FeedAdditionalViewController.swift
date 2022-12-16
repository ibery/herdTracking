//
//  FeedAdditionalViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 11.12.2022.
//

import UIKit

class FeedAdditionalViewController: BaseViewController {
    
    
    // MARK: - Properties
    
    @IBOutlet weak var feedNameTextField: UITextField!
    @IBOutlet weak var feedMountTextField: UITextField!
    @IBOutlet weak var feedDateTextField: UITextField!

    
    var feed = FeedModel()
    var addFeed = FeedModel()
    private let feedViewModel = FeedViewModel()
    private let datePicker = UIDatePicker()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        feedNameTextField.text = feed.feedName
        feedNameTextField.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = false

    }
    
    
    
    // MARK: - Setup
    
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

    @IBAction func feedUpdateButton(_ sender: UIButton) {
        feedViewModel.additionalFeed(feed: feed, addFeed: addFeed, amountTextField: feedMountTextField, feedDateTextFiedl: feedDateTextField)
    }
    

    
    //MARK: - Methods
    
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
