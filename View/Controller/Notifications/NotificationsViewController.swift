//
//  NotificationsViewController.swift
//  Herd Tracking
//
//  Created by Narkoz on 21.07.2022.
//

import UIKit
import UserNotifications

class NotificationsViewController : BaseViewController {
    
    
    // MARK: - Properties
    @IBOutlet weak var notificationTableView: UITableView!
    
    private let cowViewModel = CowViewModel()
    private let notificationModel = NotificationModel()
    private let notificationViewModel = NotificationViewModel()
    private let notificationContent = UNMutableNotificationContent()

    
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        weanerNotification()
        dryOffNotification()
        notificationTableView.delegate = self
        notificationTableView.dataSource = self
        self.notificationTableView.register(UINib(nibName: Constants.TableView.notificationController, bundle: nil), forCellReuseIdentifier: Constants.TableView.notificationCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.addSideMenuButton()
    }
    
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    private func testNotification(title : String, subtitle : String, body : String ,identifier : String){
        
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.subtitle = subtitle
        notificationContent.body = body
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let notification = UNNotificationRequest(identifier: identifier, content: notificationContent, trigger: trigger)
        UNUserNotificationCenter.current().add(notification , withCompletionHandler: nil)
        
        notificationModel.title = title
        notificationModel.subTitle = subtitle
        notificationModel.body = body
        
        notificationViewModel.addNotificationViewModel(notification: notificationModel)
        
    }
    
    private func weanerNotification(){
        
        for i in cowViewModel.fetchCowViewModel(){
            if NumberOfDays.dateDayCount(date: i.dateOfBirth) == 73 {
                if !earTagControl(cow: i){
                    testNotification(title: "Bildirim", subtitle: "Sütten Kes", body: "\(i.earTag) küpe nolu buzağı sütten kesilecek", identifier: "sütKes")
                }
            }
        }
    }
    
    private func dryOffNotification(){
        for i in cowViewModel.fetchCowViewModel(){
            for a in i.inseminations {
                if a.inseminationsStatus == "Başarılı"{
                    if NumberOfDays.dateDayCount(date: a.inseminationDate) == 207 {
                        if !earTagControl(cow: i){
                            testNotification(title: "Bildirim", subtitle: "kuruya çıkar", body: "\(i.earTag) küpe nolu hayvanı kuruya çıkar", identifier: "kuruDonem")
                            break
                        }
                    }
                }
            }
        }
    }
    
    private func inseminatedControl(){
        for i in cowViewModel.fetchCowViewModel(){
            for a in i.inseminations {
                if a.inseminationsStatus == "Beklemede"{
                    if NumberOfDays.dateDayCount(date: a.inseminationDate) > 19 && NumberOfDays.dateDayCount(date: a.inseminationDate) < 23 {
                        testNotification(title: "Bildirim", subtitle: "kızgın olabilir", body: "\(i.earTag) küpe nolu hayvan kızgın olabilir", identifier: "kızgın")
                        break
                    }
                }
            }
        }
    }
    
    private func earTagControl(cow : CowModel)-> Bool{
        var status = false
        for i in notificationViewModel.fetchNotificaitonViewModel() {
            if i.earTag == cow.earTag{
                status =  true
                break
            }
        }
        return status
    }
}

extension NotificationsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationViewModel.fetchNotificaitonViewModel().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.notificationCell, for: indexPath) as? NotificationTableViewCell else {return UITableViewCell()}
        cell.subTitleLabel.text = notificationViewModel.fetchNotificaitonViewModel()[indexPath.row].subTitle
        cell.bodyLabel.text = notificationViewModel.fetchNotificaitonViewModel()[indexPath.row].body
        return cell
        
    }
    
    
}
