//
//  MyWorksViewController.swift
//  Herd Tracking
//
//  Created by Narkoz on 9.05.2022.
//

import UIKit

class MyWorksViewController: BaseViewController {
    
    // MARK: - Properties
    @IBOutlet weak var myWorkMenuCellection: UICollectionView!
    @IBOutlet weak var firstPregnancyView: FirstPregnancyViewController!
    @IBOutlet weak var secondPregnancyView: SecondPregnancyViewController!
    @IBOutlet weak var inseminatedView: InseminatedViewController!
    @IBOutlet weak var WeanedView: CalfToBeWeaned!
    @IBOutlet weak var dryOffView: DryOffViewController!
    @IBOutlet weak var nearBirthView: NearBirthViewController!
    var cowViewModel = CowViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inseminatedView.delegate = self
        firstPregnancyView.delegate = self
        secondPregnancyView.delegate = self
        nearBirthView.delegate = self
        myWorkMenuCellection.delegate = self
        myWorkMenuCellection.dataSource = self
        
        self.myWorkMenuCellection.register(UINib(nibName: Constants.CollectionView.cowCardMenuCollectionView, bundle: nil), forCellWithReuseIdentifier: Constants.CollectionView.cowCardMenuCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.addSideMenuButton()
        inseminatedView.inseminatedTableView.reloadData()
        firstPregnancyView.firtsPregnancyTableView.reloadData()
        viewHidden()
        secondPregnancyView.secondPregnancyTableView.reloadData()
        dryOffView.dryOffTableView.reloadData()
        WeanedView.weanedTableView.reloadData()
        nearBirthView.nearBirthTableView.reloadData()
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let indexPath:IndexPath = IndexPath(row: 0, section: 0)
        myWorkMenuCellection?.selectItem(at: indexPath, animated: false, scrollPosition: .top)
        
    }
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
    private func viewHidden(){
        inseminatedView.isHidden = false
        firstPregnancyView.isHidden = true
        secondPregnancyView.isHidden = true
        dryOffView.isHidden = true
        WeanedView.isHidden = true
        nearBirthView.isHidden = true
    }
    
}

extension MyWorksViewController : UICollectionViewDataSource , UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MyWork.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionView.cowCardMenuCell, for: indexPath) as? CowCardMenuCollectionViewCell else {return UICollectionViewCell()}

            cell.menuLabel.textColor = .blue
            cell.menuLabel.text = MyWork(rawValue: indexPath.row)?.name
        Constants.collectionRow = indexPath.row
        return cell
      
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width - 16.0 * 2
        let height: CGFloat = 300.0
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            let work = MyWork(rawValue: indexPath.row)
       
            switch work {
            case .inseminated:
                return inseminatedView.isHidden = false
            case .firstPregnancy:
                return firstPregnancyView.isHidden = false
            case .secondPregnancy:
                return secondPregnancyView.isHidden = false
            case .dryOff:
                return dryOffView.isHidden = false
            case.nearBirth:
                return nearBirthView.isHidden = false
            case.weaning:
                return WeanedView.isHidden = false
            case .none: break

            }
        

    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let work = MyWork(rawValue: indexPath.row)

        switch work {
        case .inseminated:
            return inseminatedView.isHidden = true
        case .firstPregnancy:
            return firstPregnancyView.isHidden = true
        case .secondPregnancy:
            return secondPregnancyView.isHidden = true
        case .dryOff:
            return dryOffView.isHidden = true
        case.nearBirth:
            return nearBirthView.isHidden = true
        case.weaning:
            return WeanedView.isHidden = true
        case .none: break

        }
    }
    
}

extension MyWorksViewController : myWorkToCowCard{
    func toCowCard( cowModel : CowModel) {
        
        guard let viewController = self.getViewController(fromStoryboard: .card, type: CowCardViewController.self) else {return}
        viewController.cow = cowModel
        self.navigationController?.show(viewController, sender: nil)
        
    }
    
    
}
 

