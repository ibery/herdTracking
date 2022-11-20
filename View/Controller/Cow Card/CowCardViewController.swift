//
//  CowCardViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 7.10.2022.
//

import UIKit


class CowCardViewController : BaseViewController {
    
    
    // MARK: - Properties
    @IBOutlet weak var generalInformationsView: GeneralInformationsController!
    @IBOutlet weak var inseminationInformationsView: InseminationInformationsController!
    
    @IBOutlet weak var birthInfoView: BirthInfoListController!
    
    
    @IBOutlet weak var vaccineView: VaccineViewController!
    @IBOutlet weak var noteView: NoteViewController!
    @IBOutlet weak var pregnancyControlView: PregnancyControlViewController!
    @IBOutlet weak var otherView: OtherViewController!
    private var editButton = UIBarButtonItem()
    
    @IBOutlet weak var cowEditingView: CowCardEditingController!
    
    @IBOutlet weak var earTagLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cowCardMenuCollectionView: UICollectionView!
    @IBOutlet weak var cowProfileImage: UIImageView!
    @IBOutlet weak var numberOfDaysMilkedLabel: UILabel!
    @IBOutlet weak var numberOfLactationLabel: UILabel!
    
    var cow : CowModel = CowModel()
    var birthInfoController = BirthInfoController()
    let datePicker = UIDatePicker()
    var pregnancyDate = UITextField()
    //    var cowCardEditing = CowCardEditingController()
    
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScreen()
        earTagLabel.text = cow.earTag
        nameLabel.text = cow.cowName
        if let numberLactation = cow.numberOfLactations {
            numberOfLactationLabel.text = "\(numberLactation)"
        }else{
            numberOfLactationLabel.text = "-"
        }
       
        if let lastCalving = cow.lastCalvingDate{
            numberOfDaysMilkedLabel.text = "\( NumberOfDays.dateDayCount(date: lastCalving))"
        }else{
            numberOfDaysMilkedLabel.text = "-"
        }
         
        cowEditingView.isHidden = true
        cowEditingView.delegate = self
        cowCardMenuCollectionView.delegate = self
        cowCardMenuCollectionView.dataSource = self
        inseminationInformationsView.delegate = self
        birthInfoView.delegate = self
        generalInformationsView.delegate = self
        pregnancyControlView.delegate = self
        vaccineView.delegate = self
        noteView.delegate = self
        otherView.delegate = self
        self.cowCardMenuCollectionView.register(UINib(nibName: Constants.CollectionView.cowCardMenuCollectionView, bundle: nil), forCellWithReuseIdentifier: Constants.CollectionView.cowCardMenuCell)
  //      createDatePicker()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let indexPath:IndexPath = IndexPath(row: 0, section: 0)
        cowCardMenuCollectionView?.selectItem(at: indexPath, animated: false, scrollPosition: .top)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        
        
    }
    
    // MARK: - Setup
    func setupScreen(){
        editButton   = UIBarButtonItem(image: UIImage(systemName: "note.text"),  style: .plain, target: self, action: #selector(editTapped))
        navigationItem.rightBarButtonItems = [editButton]
    }
    
    func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        datePicker.preferredDatePickerStyle = .wheels
        let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(CowCardViewController.cancelButtonClicked))
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(CowCardViewController.doneButtonClicked))
        toolbar.setItems([cancelButton,.flexibleSpace() ,doneButton], animated: true)
        pregnancyDate.inputAccessoryView = toolbar
        pregnancyDate.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    

    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    @objc func editTapped(){
        // düzenlemeyer güncellenecek
        cowEditingView.isHidden = false
    }
    
    @objc func doneButtonClicked(){

        if let datePickerView = self.datePicker.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.pregnancyDate.text = dateString

            self.pregnancyDate.resignFirstResponder()
        }
    }

    @objc func cancelButtonClicked(){
        self.pregnancyDate.resignFirstResponder()
    }

   
}

extension CowCardViewController :   CowCardEditingProtocol, GetCowAndViewProtocol , VaccineProtocol ,NoteProtocol{
    func closeAddInseminationView() {}
    
    func inseminationToHome() {
        self.navigationController?.show(Storyboard.home.viewController!, sender: nil)
    }
    
    func noteCow() -> CowModel {
        return cow
    }
    
    func noteHiddenView() {
        self.navigationController?.show(Storyboard.home.viewController!, sender: nil)
    }
    
    func toHome() {
        guard let viewController = self.getViewController(fromStoryboard: .home, type: HomeViewController.self) else {return}
        self.navigationController?.show(viewController, sender: nil)
    }
    
    func vaccineCow() -> CowModel {
        return cow
    }
    
    func toPage(cow: CowModel,row :Int) {
        
        guard let viewController = self.getViewController(fromStoryboard: .pregnancyInspection, type: PregnancyInspectionViewController.self) else {return}
        viewController.cow = cow
        viewController.row = row
        self.navigationController?.show(viewController, sender: nil)
        
    }
    
    func cowCardEditinCow()-> CowModel{
        return cow
    }
    
    func closeCowCardEditingView() {
        cowEditingView.isHidden = true
    }
    
    func getCow() -> CowModel {
        return cow
    }
    
    
    
    
    
}




extension CowCardViewController : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Views.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionView.cowCardMenuCell, for: indexPath) as? CowCardMenuCollectionViewCell else {return UICollectionViewCell()}
        cell.menuLabel.text = Views(rawValue: indexPath.row)?.name
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width - 16.0 * 2
        let height: CGFloat = 300.0
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let views = Views(rawValue: indexPath.row)
        
        switch views {
        case .general:
            return generalInformationsView.isHidden = false
        case .inseminations:
            return inseminationInformationsView.isHidden = false
        case .birth:
            return birthInfoView.isHidden = false
        case .pregnancyControl:
            return pregnancyControlView.isHidden = false
        case .vaccine:
            return vaccineView.isHidden = false
        case .note:
            return noteView.isHidden = false
        case .other:
            return otherView.isHidden = false
        case .none: break
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let views = Views(rawValue: indexPath.row)
        
        switch views {
        case .general:
            return generalInformationsView.isHidden = true
        case .inseminations:
            return inseminationInformationsView.isHidden = true
        case .birth:
            return birthInfoView.isHidden = true
        case .pregnancyControl:
            return pregnancyControlView.isHidden = true
        case .vaccine:
            return vaccineView.isHidden = true
        case .note:
            return noteView.isHidden = true
        case .other:
            return otherView.isHidden = true
        case .none: break
            
        }
    }
    
    
}


extension UITextField {
   func datePicker<T>(target: T,
                   doneAction: Selector,
                   cancelAction: Selector,
                   datePickerMode: UIDatePicker.Mode = .date) {
    let screenWidth = UIScreen.main.bounds.width
    
    func buttonItem(withSystemItemStyle style: UIBarButtonItem.SystemItem) -> UIBarButtonItem {
        let buttonTarget = style == .flexibleSpace ? nil : target
        let action: Selector? = {
            switch style {
            case .cancel:
                return cancelAction
            case .done:
                return doneAction
            default:
                return nil
            }
        }()
        
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: style,
                                            target: buttonTarget,
                                            action: action)
        
        return barButtonItem
    }
    
    let datePicker = UIDatePicker(frame: CGRect(x: 0,
                                                y: 0,
                                                width: screenWidth,
                                                height: 216))
    datePicker.datePickerMode = datePickerMode
    datePicker.preferredDatePickerStyle = .inline
    self.inputView = datePicker
    
    let toolBar = UIToolbar(frame: CGRect(x: 0,
                                          y: 0,
                                          width: screenWidth,
                                          height: 44))
    toolBar.setItems([buttonItem(withSystemItemStyle: .cancel),
                      buttonItem(withSystemItemStyle: .flexibleSpace),
                      buttonItem(withSystemItemStyle: .done)],
                     animated: true)
    self.inputAccessoryView = toolBar
    }
    }
