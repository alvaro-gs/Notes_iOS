//
//  DetailNoteViewController.swift
//  Notes
//
//  Created by Álvaro Gómez Segovia on 27/09/23.
//

import UIKit

class DetailNoteViewController: UIViewController {

    var note: Note?
    @IBOutlet weak var noteContent: UITextView!
    @IBOutlet weak var noteTitle: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        noteTitle.text = note?.title
        noteContent.text = note?.content
        
        noteTitle.delegate = self
        noteContent.delegate = self
    }
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destination = segue.destination as! NotesTableViewController
        note?.title = noteTitle.text
        note?.content = noteContent.text
        note?.date = Date()
        destination.note = note
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (noteTitle.text.isEmpty && noteContent.text.isEmpty){
            return false
        }else{
            return true
        }
    }

}
