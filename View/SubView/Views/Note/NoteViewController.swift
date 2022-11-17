//
//  NoteViewController.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 27.10.2022.
//

import Foundation
import UIKit

class NoteViewController : UIView , NibInitializable {
    
    // MARK: - Properties

    
    @IBOutlet weak var addNoteView: AddNoteController!
    @IBOutlet weak var noteTableView: UITableView!
    var nibName: String = "NoteScreen"
    var delegate : NoteProtocol?


    
    
    // MARK: - Initializers
    
    required init?(coder: NSCoder ) {
        
        super.init(coder: coder)
        self.initiliaze(withNibName: self.nibName, self.postInitialize)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initiliaze(withNibName: self.nibName, self.postInitialize)
        
    }
    
    private func postInitialize(_ view: UIView) {}
    
    // MARK: - Setup
    
    override func layoutSubviews() {
        noteTableView.delegate = self
        noteTableView.dataSource = self
        
    }
    
    // MARK: - Actions
    @IBAction func showAddNoteController(_ sender: UIButton) {
        addNoteView.isHidden = false
        print("add button tıklandı")
    }
    
    
    // MARK: - Methods
    
    private func setup(){}
}

extension NoteViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension NoteViewController : NoteProtocol {
    func noteCow() -> CowModel {
        guard let delegate = delegate?.noteCow() else{return CowModel()}
        return delegate
    }
    
    func hiddenView() {
        addNoteView.isHidden = true
        print("noteViewcontroller")
    }
    
    
}

