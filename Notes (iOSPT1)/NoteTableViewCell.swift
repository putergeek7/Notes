//
//  NoteTableViewCell.swift
//  Notes (iOSPT1)
//
//  Created by Pat on 4/29/19.
//  Copyright © 2019 putergeek. All rights reserved.
//

import UIKit



protocol NoteTableViewCellDelegate: AnyObject {
    func shareNote(for cell: NoteTableViewCell)
}

class NoteTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var noteLabel: UILabel!
    
    @IBAction func sharedButtonTapped(_ sender: Any) {
        self.delegate?.shareNote(for: self)
    }
    var note: Note? {
        
        didSet {
            
            self.updateView()
        }
    }
    
    weak var delegate: NoteTableViewCellDelegate?
    
    private func updateView() {
        
        guard let note = self.note else { return }
        self.noteLabel.text = note.text
    }
    
}


