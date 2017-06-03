//
//  CoreDataHelpers.swift
//  MakeSchoolNotes
//
//  Created by Jordan Harvey-Morgan on 6/3/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataHelper {
    // static methods can be called directly w/o instantiating an instance of the class first
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    // create a new note
    static func newNote() -> Note {
        let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: managedContext) as! Note
        return note
    }
    
    // save a note
    static func saveNote() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    // delete a note 
    static func deleteNote(toDelete note: Note) {
        managedContext.delete(note)
        // why don't I need a self in front of saveNote()
        saveNote()
    }
    
    // get all notes
    static func getNotes() -> [Note]{
        let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        
        return []
    }
    
}// end class
