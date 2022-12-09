//
//  NotificationViewModel.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 7.12.2022.
//

import Foundation
import RealmSwift

class  NotificationViewModel{
    
    // MARK: - Properties
    
    
    // MARK: - Initializers
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    // MARK: - Methods
    
    func addNotificationViewModel(notification : NotificationModel){
        LocaleService.shared.addNotification(notification: notification)
    }
    
    func fetchNotificaitonViewModel()-> Results<NotificationModel>{
        return LocaleService.shared.fetchNotification()
    }
}

