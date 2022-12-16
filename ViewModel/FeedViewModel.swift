//
//  FeedViewModel.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 8.12.2022.
//

import Foundation
import RealmSwift

class FeedViewModel {
    
    // MARK: - Properties
    
    
    // MARK: - Initializers
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func textFieldControl(nameText : UITextField , amountText : UITextField , dailyText : UITextField , dateText : UITextField)->Bool{
        
        if nameText.text == "" || amountText.text == "" || dailyText.text == "" || dateText.text == "" {
           return true
        }else{
            return false
        }
    }
    
    func addFeedViewModel(feed : FeedModel ){
        LocaleService.shared.addFeed(feed: feed)
    }
    
    func fetchFeedViewModel()-> Results<FeedModel>{
        return LocaleService.shared.fetchFeed()
    }
    
    func controlFeedName(feedName : String) -> Bool{
        var status = false
        for i in fetchFeedViewModel(){
            if i.feedName == feedName{
                status = true
                break
            }
        }
        return status
    }
    
    func additionalFeed (feed : FeedModel , addFeed :FeedModel , amountTextField : UITextField , feedDateTextFiedl : UITextField){
        if amountTextField.text == "" || feedDateTextFiedl.text == "" {
            UIWindow.showAlert(title: Constants.Alert.title, message: Constants.Alert.emptyFeed)
        }else{
            guard let amountText = amountTextField.text else {return}
            guard let doubleAmountText = Double(amountText) else {return}
            guard let feedDate = feedDateTextFiedl.text else {return}
            let days = NumberOfDays.dayBetweenTwoDates(date: feed.feedDate, twiceDate: feedDate)
            
            let used = Double(days) * feed.dailyUse
            let stock = feed.amountReceived - used
            if stock < 0 || stock == 0{
                addFeed.amountReceived = doubleAmountText
            }else{
                addFeed.amountReceived = doubleAmountText + stock
            }
            addFeed.feedDate = feedDate
            LocaleService.shared.updateAdditionalFeed(feed: feed, addFeed: addFeed)
            
            FeedAdditionalViewController().navigationController?.show(Storyboard.feed.viewController!, sender: nil)

        }
        
    }
}


