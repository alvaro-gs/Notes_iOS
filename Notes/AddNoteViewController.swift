//
//  AddNoteViewController.swift
//  Notes
//
//  Created by Álvaro Gómez Segovia on 23/09/23.
//

import UIKit

class AddNoteViewController: UIViewController {

    
    @IBOutlet weak var noteContent: UITextView!
    @IBOutlet weak var noteTitle: UITextView!
    
    var newNote: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTitle.delegate = self
        noteContent.delegate = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        newNote = Note (title: noteTitle.text!, content: noteContent.text!, date: Date())
        let destination = segue.destination as! NotesTableViewController
        destination.note = newNote
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (noteTitle.text.isEmpty && noteContent.text.isEmpty) {
            return false
        }else{
            return true
        }
        
    }
    

}
