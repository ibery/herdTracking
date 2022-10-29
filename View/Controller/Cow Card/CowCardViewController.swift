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
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var grupLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var reproductiveStatusLabel: UILabel!
    @IBOutlet weak var leashNumberLabel: UILabel!
//    @IBOutlet weak var syringeImage: UIImageView!
//    @IBOutlet weak var spermsImage: UIImageView!
//    @IBOutlet weak var birthImage: UIImageView!
//    @IBOutlet weak var noteImage: UIImageView!
    @IBOutlet weak var cowCardMenuCollectionView: UICollectionView!
    @IBOutlet weak var cowProfileImage: UIImageView!
    
    
    
    var cow : CowModel = CowModel()
//    var cowCardEditing = CowCardEditingController()
   
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("bir")
        setupScreen()
        earTagLabel.text = cow.earTag
        cowEditingView.isHidden = true
        cowEditingView.delegate = self
        cowCardMenuCollectionView.delegate = self
        cowCardMenuCollectionView.dataSource = self
        inseminationInformationsView.delegate = self
        generalInformationsView.delegate = self
        self.cowCardMenuCollectionView.register(UINib(nibName: Constants.CollectionView.cowCardMenuCollectionView, bundle: nil), forCellWithReuseIdentifier: Constants.CollectionView.cowCardMenuCell)
 //       setupProperties()
       
        print("collection view ")
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
    
//    func setupProperties(){
//        // Burası guard lanacak
//     //   guard let cow = cow else {return}
//        earTagLabel.text = "Küpe : \(cow.earTag)"
//        ageLabel.text = "Yaş : \(String(NumberOfDays.dateDayCount(date: cow.dateOfBirth, format: "dd.MM.yy")))"
//        grupLabel.text = "Grup No : \(cow.groupNo)"
//        nameLabel.text = "Adı : \(cow.cowName)"
//        reproductiveStatusLabel.text = "Üreme Durumu : \(cow.reproductiveStatus?.name)"
//        leashNumberLabel.text = "Tasma No : \( cow.leashNumber)"
//        syringeImage.isUserInteractionEnabled = true
//        spermsImage.isUserInteractionEnabled = true
//        birthImage.isUserInteractionEnabled = true
//        noteImage.isUserInteractionEnabled = true
//
//        syringeImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(syringeImageClick)))
//        spermsImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(spermsImageClick)))
//        birthImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(birthImageClick)))
//        noteImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(noteImageClick)))
//
//    }
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    @objc func editTapped(){
       // düzenlemeyer güncellenecek
        cowEditingView.isHidden = false
    }
    

//    @objc func spermsImageClick(){
//        guard let viewController = self.getViewController(fromStoryboard: .inseminations , type: AddInseminationsViewController.self) else {return}
//        viewController.cow = cow
//        self.navigationController?.show(viewController, sender: nil)
//
//    }
    
//    func firstItemSelect(){
//
//    }
    
    
    
}

extension CowCardViewController :   CowCardEditingProtocol, GetCowAndViewProtocol {

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
        print("indexpaht1 row : \(indexPath.row)")
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



