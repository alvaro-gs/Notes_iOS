//
//  NoteManager.swift
//  Notes
//
//  Created by Álvaro Gómez Segovia on 22/09/23.
//

import Foundation

class NoteManager{
    
    private var notes : [Note] = []
    
    init(){
        loadNotes()
    }
    
    func createNote(note : Note){
        notes.append(note)
    }
    
    func deleteNote(at index : Int ){
        notes.remove(at: index)
    }
    
    func countNotes() -> Int {
        return notes.count
    }
    
    func getNote(at index : Int) -> Note {
        return notes[index]
    }
    
    func getNotes() -> [Note]{
        return notes
    }
    
    func getFilePath() -> URL {
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
                
        let noteUrlPath = documentDirectory.appendingPathComponent("notes.json")
                
        return URL(string: noteUrlPath.absoluteString)!
    }
    
    func loadNotes(){
        //load notes from filesystem
        let notesPath = getFilePath()
        
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: notesPath.path){
            do {
                let jsonData = fileManager.contents(atPath: notesPath.path)
                notes = try JSONDecoder().decode([Note].self, from: jsonData!)
            }catch let error {
                print (error)
            }
            
        }else{
            print("File does not exist")
        }
        
    }
    
    func saveNotes(){
        //saves notes to fileSystem
        
        let fileManager = FileManager.default
                
        do{
            let jsonData = try JSONEncoder().encode(notes)
            fileManager.createFile(atPath: getFilePath().path, contents: jsonData)
        }catch let error{
            print(error)
        }
    }

    //MARK: Homework
    func updateNote(note : Note, at index : Int){
        //Update a note at specific index
        notes[index] = note
    }

    
    
}
