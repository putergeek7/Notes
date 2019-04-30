//
//  NoteDetailViewController.swift
//  Notes (iOSPT1)
//
//  Created by Pat on 4/29/19.
//  Copyright © 2019 putergeek. All rights reserved.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    var note: Note? {
        
        didSet {
            self.updateViews()
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
