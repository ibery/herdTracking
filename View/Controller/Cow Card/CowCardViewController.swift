//
//  CowCardViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 7.10.2022.
//

import UIKit


class CowCardViewController : BaseViewController {
    
    
    // MARK: - Properties
    private var editButton = UIBarButtonItem()
    @IBOutlet weak var cowEditingView: CowCardEditingController!
    @IBOutlet weak var earTagLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var grupLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var reproductiveStatusLabel: UILabel!
    @IBOutlet weak var leashNumberLabel: UILabel!
    @IBOutlet weak var syringeImage: UIImageView!
    @IBOutlet weak var spermsImage: UIImageView!
    @IBOutlet weak var birthImage: UIImageView!
    @IBOutlet weak var noteImage: UIImageView!
    @IBOutlet weak var cowProfileImage: UIImageView!
    
    
    
    var cow : CowModel = CowModel()
    var cowCardEditing = CowCardEditingController()
    
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        setupProperties()
        cowEditingView.isHidden = true
        cowEditingView.delegate = self
        
        
        
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
    
    func setupProperties(){
        earTagLabel.text = cow.earTag
      //ageLabe.text = şimdiki tarih - doğum tarihi
        grupLabel.text = cow.groupNo
        nameLabel.text = cow.cowName
        reproductiveStatusLabel.text = cow.reproductiveStatus?.name
        leashNumberLabel.text = cow.leashNumber
        syringeImage.isUserInteractionEnabled = true
        spermsImage.isUserInteractionEnabled = true
        birthImage.isUserInteractionEnabled = true
        noteImage.isUserInteractionEnabled = true
        
        syringeImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(syringeImageClick)))
        syringeImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(spermsImageClick)))
        syringeImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(birthImageClick)))
        syringeImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(noteImageClick)))
        
        
        
    }
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    @objc func editTapped(){
       // düzenlemeyer güncellenecek
        cowEditingView.isHidden = false
       
       
        
    }
    
    @objc func syringeImageClick (){
        
    }
    
    @objc func spermsImageClick(){
        
    }
    
    @objc func birthImageClick(){
        
    }
    
    @objc func noteImageClick(){
        
    }
    
    
    
}

extension CowCardViewController : CloseViewProtocol{
    func getTextField() -> CowModel {
        print("get text func çalıştı")
        return self.cow
    }
    
    func closeView() {
        cowEditingView.isHidden = true
        print("delegate çalıştı")
    }
    
    
}
    

