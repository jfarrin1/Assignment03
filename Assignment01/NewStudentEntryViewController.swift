//
//  NewStudentEntry.swift
//  Assignment01
//
//  Created by James Farrington on 2/14/16.
//  Copyright © 2016 James Farrington. All rights reserved.
//

import UIKit

class NewStudentEntryViewController: UIViewController {
    var roster: ClassRoster?
    var formatter = NSDateFormatter()
    

    @IBOutlet weak var FirstName: UITextView!
    
    @IBOutlet weak var LastName: UITextView!
 
    @IBOutlet weak var Home: UITextView!
    
    @IBOutlet weak var Emoji: UITextView!
    
    @IBOutlet weak var Birthday: UITextView!
    
    @IBOutlet weak var Classification: UITextView!
    
    @IBAction func CancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func SaveButton(sender: UIBarButtonItem) {
        let entry = student()
        formatter.dateFormat = "YYYY-MM-DD"
        entry.DOB = formatter.dateFromString(Birthday.text)
        entry.First = FirstName.text
        entry.Last = LastName.text
        entry.Home = Home.text
        entry.Classification = Classification.text
        entry.birthday = entry.dateStringAs(entry.DOB!)
        entry.emoji = Emoji.text
        
        roster?.addEntry(entry)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            navigationItem.title = "Add New Student"
    }

    
}