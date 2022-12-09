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
}

