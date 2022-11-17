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
    @IBOutlet weak var noteDateTextField: UITextField!
    
    @IBOutlet weak var noteTableView: UITableView!
    @IBOutlet weak var addNoteTextField: UITextField!
    
    var nibName: String = "NoteScreen"

    
    
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
