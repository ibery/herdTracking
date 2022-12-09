//
//  FeedViewController.swift
//  Herd Tracking
//
//  Created by Narkoz on 21.07.2022.
//

import UIKit
import ChameleonFramework

class FeedViewController : BaseViewController {
    
    
    // MARK: - Properties

    @IBOutlet weak var addFeedTableView: UITableView!
    @IBOutlet weak var addFeedView: AddFeed!
    @IBOutlet weak var containerView: UIView!
    
    private var editButton = UIBarButtonItem()
    private let feedViewModel = FeedViewModel()
    private let feedModel = FeedModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       containerView.backgroundColor = FlatGreen()
        setupScreen()
        addFeedView.delegate = self
        addFeedTableView.delegate = self
        addFeedTableView.dataSource = self
        self.addFeedTableView.register(UINib(nibName: Constants.TableView.feedController, bundle: nil), forCellReuseIdentifier: Constants.TableView.feedCell)
        addFeedTableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.addSideMenuButton()
        tabBarController?.tabBar.isHidden = false
    }
    
    
    
    // MARK: - Setup
    
    private func setupScreen(){
        editButton   = UIBarButtonItem(image: UIImage(systemName: "plus"),  style: .plain, target: self, action: #selector(editTapped))
        navigationItem.rightBarButtonItems = [editButton]
    }
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
    @objc func editTapped(){
        addFeedView.isHidden = false
    }
}

extension FeedViewController : AddFeedProtocol{
    func closeAddFeedView() {
        addFeedView.isHidden = true
        addFeedTableView.reloadData()
    }
    
    
}

extension FeedViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedViewModel.fetchFeedViewModel().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.feedCell, for: indexPath) as? FeedTableViewCell else {return UITableViewCell()}
        
        cell.feedNameLabel.text = feedViewModel.fetchFeedViewModel()[indexPath.row].feedName
        let days = NumberOfDays.dateDayCount(date: feedViewModel.fetchFeedViewModel()[indexPath.row].feedDate)
        let used = Double (days) * feedViewModel.fetchFeedViewModel()[indexPath.row].dailyUse
        let amountReceived = feedViewModel.fetchFeedViewModel()[indexPath.row].amountReceived - used
        cell.theAmountOffStockLabel.text = String(format: "%.1f", amountReceived)
        cell.dailyUseLabel.text = String(feedViewModel.fetchFeedViewModel()[indexPath.row].dailyUse)
        let remaingDays = amountReceived / feedViewModel.fetchFeedViewModel()[indexPath.row].dailyUse
        cell.numberOfDaysRemainingLabel.text = String(format: "%.1f", remaingDays)
        
//        cell.backgroundColor = UIColor(hexString: <#T##String#>)
       
        
        if let colour = FlatGreen().darken(byPercentage: CGFloat(indexPath.row) / CGFloat(feedViewModel.fetchFeedViewModel().count)) {
            cell.backgroundColor = colour
            cell.feedNameLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.theAmountOffStockLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.dailyUseLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.numberOfDaysRemainingLabel.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.feedNameTitle.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.amountTitle.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.dailyTitle.textColor = ContrastColorOf(colour, returnFlat: true)
            cell.numberOfDayTitle.textColor = ContrastColorOf(colour, returnFlat: true)
            
        }
       
       
        return cell
        
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    
}
