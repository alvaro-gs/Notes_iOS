//
//  NotesTableViewController.swift
//  Notes
//
//  Created by Álvaro Gómez Segovia on 22/09/23.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    @IBOutlet var emptyNotesView: UIView!
    
    @IBOutlet var tableViewNotes: UITableView!
    
    var note : Note?
    let noteManager = NoteManager()
    var notePosition: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if noteManager.countNotes() == 0 {
            emptyNotesView.isHidden = false
            tableViewNotes.backgroundView = emptyNotesView
            
        }else{
            noteManager.loadNotes()
            emptyNotesView.isHidden = true
        }
    }
    
    override func viewDidLayoutSubviews() {
        if noteManager.countNotes() == 0 {
            emptyNotesView.isHidden = false
            tableViewNotes.backgroundView = emptyNotesView
            
        }else{
            noteManager.loadNotes()
            emptyNotesView.isHidden = true
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return noteManager.countNotes()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteCell
        let note = noteManager.getNote(at: indexPath.row)
        cell.noteTitle.text = note.title
        cell.noteContent.text = note.content
        cell.noteDate.text = note.date.iso8601String
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        note = noteManager.getNote(at: indexPath.row)
        notePosition = indexPath.row
        self.performSegue(withIdentifier: "detailNoteSegue", sender: Self.self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let navVC = segue.destination as! UINavigationController
        let title = navVC.viewControllers.first?.title
        if (title) == "Add Note"{
            let destination = navVC.viewControllers.first as! AddNoteViewController
        }
        if (title) == "Note Detail"{
            let destination = navVC.viewControllers.first as! DetailNoteViewController
            destination.note = note
        }
            
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            noteManager.deleteNote(at: indexPath.row)
            noteManager.saveNotes()
            tableViewNotes.reloadData()
            
            
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    @IBAction func unWindFromAddNote(segue: UIStoryboardSegue) {
        let source = segue.source as! AddNoteViewController
        note = source.newNote
        noteManager.createNote(note: note!)
        noteManager.saveNotes()
        tableViewNotes.reloadData()
    }
    
    @IBAction func unWindFromDetailNote(segue: UIStoryboardSegue) {
        let source = segue.source as! DetailNoteViewController
        note = source.note
        noteManager.updateNote(note: note!, at: notePosition!)
        noteManager.saveNotes()
        tableViewNotes.reloadData()
    
    }
    
    
}
