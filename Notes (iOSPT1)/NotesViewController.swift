//
//  NotesViewController.swift
//  Notes (iOSPT1)
//
//  Created by Pat on 4/29/19.
//  Copyright © 2019 putergeek. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDataSource, NoteTableViewCellDelegate, UITableViewDelegate  {
    
    //Outlets and Properties
    let notesController = NotesController()
    @IBOutlet weak var notesTableView: UITableView!
    @IBOutlet weak var notesTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.notesTableView.delegate = self
        self.notesTableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.notesController.notes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        guard let noteCell = cell as? NoteTableViewCell else { return cell }
        
        let note = notesController.notes[indexPath.row]
        noteCell.note = note
        noteCell.delegate = self
        
        return cell
    }
    
    
    @IBAction func saveNoteButtonTapped(_ sender: Any) {
        
        guard let text = self.notesTextView.text else { return }
        
        notesController.createNote(withText: text)
        self.notesTextView.text = nil
        self.notesTableView.reloadData()
    }
    
    func shareNote(for cell: NoteTableViewCell) {
        
        guard let note = cell.note else { return }
        
        let text = note.text
        
        let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
    }
    
    /* // delegate view
     1. Create Protocol
     2. Add properties and methods to protocol
     3. In delegator create (weak var delegate property of type [Protocol]
     4. IN IBAction call self.delegate.[insert method name here]
 
     // Delegeate view
     1. actop the protocol
     2. assign the delegate when initializing the delegator view
     3. "add protocol stubs"
     4. add code in delegate method that you want the delegate to complete
 */
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail" {
            guard let cell = sender as? NoteTableViewCell,
                let detailVC = segue.destination as? NoteDetailViewController else {
                    detailVC.note = cell.note
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
