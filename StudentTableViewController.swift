//
//  StudentTableViewController.swift
//  Assignment01
//
//  Created by James Farrington on 2/14/16.
//  Copyright © 2016 James Farrington. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController {
    
    let cellReuseIdentifier = "RosterEntryCell"

    var roster = ClassRoster(entries: [student]())
    let student1 = student()
    let student2 = student()
    let student3 = student()
    let student4 = student()
    let student5 = student()
    var formatter = NSDateFormatter()
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roster.count
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let newStudentEntryViewController = segue.destinationViewController as? NewStudentEntryViewController{
                newStudentEntryViewController.roster = roster
        }  
        if let studentEntryViewController = segue.destinationViewController as? StudentEntryViewController, cell = sender as? UITableViewCell,
            indexPath = self.tableView.indexPathForCell(cell),
            entry = roster.entry(indexPath.row){
            studentEntryViewController.student1 = entry
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath)
        if let rosterCell = cell as? StudentTableViewCell, entry = roster.entry(indexPath.row) {
            rosterCell.Emoji.text = entry.emoji
            rosterCell.Name.text = entry.First
            rosterCell.Hometown.text = entry.Home

        }
        
        return cell
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enum grade: String{
            case freshman
            case sophomore
            case junior
            case senior
        }
        formatter.dateFormat = "YYYY-MM-DD"
        student1.DOB = formatter.dateFromString("1994-04-19")
        student1.First = "James"
        student1.Last = "Bowyer"
        student1.Home = "South Bend IN"
        student1.Classification = grade.senior.rawValue
        student1.birthday = student1.dateStringAs(student1.DOB!)
        student1.emoji = "😀"
        roster.addEntry(student1)
        student2.DOB = formatter.dateFromString("1996-08-27")
        student2.First = "Yaosxin"
        student2.Last = "Qu"
        student2.Home = "China"
        student2.Classification = grade.sophomore.rawValue
        student2.birthday = student2.dateStringAs(student2.DOB!)
        student2.emoji = "😋"
        roster.addEntry(student2)
        student3.DOB = formatter.dateFromString("1994-08-09")
        student3.First = "Jay"
        student3.Last = "Michuda"
        student3.Home = "Frankfort, IL"
        student3.Classification = grade.senior.rawValue
        student3.birthday = student3.dateStringAs(student3.DOB!)
        student3.emoji = "😵"
        roster.addEntry(student3)
        student4.DOB = formatter.dateFromString("1994-02-10")
        student4.First = "Thomas"
        student4.Last = "Behrens"
        student4.Home = "Mishawaka IN"
        student4.Classification = grade.senior.rawValue
        student4.birthday = student4.dateStringAs(student4.DOB!)
        student4.emoji = "👨‍"
        roster.addEntry(student4)
        student5.DOB = formatter.dateFromString("1993-11-05")
        student5.First = "Tim"
        student5.Last = "Pusateri"
        student5.Home = "Sewickley, Pennslyvania"
        student5.Classification = grade.senior.rawValue
        student5.birthday = student5.dateStringAs(student5.DOB!)
        student5.emoji = "😎"
        roster.addEntry(student5)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
