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
        addNoteView.delegate = self
        self.noteTableView.register(UINib(nibName: Constants.TableView.noteController, bundle: nil), forCellReuseIdentifier: Constants.TableView.noteCell)
    }
    
    // MARK: - Actions
    @IBAction func showAddNoteController(_ sender: UIButton) {
        addNoteView.isHidden = false
    }
    
    
    // MARK: - Methods
    
    private func setup(){}
}

extension NoteViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let delegate = delegate else {return 0}
        return delegate.noteCow().noteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableView.noteCell, for: indexPath) as? NoteTableViewCell else {return UITableViewCell()}
        guard let delegate = delegate else {return UITableViewCell()}
        cell.noteLabel.text = delegate.noteCow().noteList[indexPath.row].noteName
        cell.dateLabel.text = delegate.noteCow().noteList[indexPath.row].noteDate
        return cell
    }
    
    
}

extension NoteViewController : NoteProtocol {
    func noteCow() -> CowModel {
        guard let delegate = delegate?.noteCow() else{return CowModel()}
        return delegate
    }
    
    func noteHiddenView() {
        addNoteView.isHidden = true
        guard let delegate = delegate else {return}
        delegate.noteHiddenView()
    }
    
    
}

