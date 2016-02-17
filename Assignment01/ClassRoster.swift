//
//  ClassRoster.swift
//  Assignment01
//
//  Created by James Farrington on 2/14/16.
//  Copyright © 2016 James Farrington. All rights reserved.
//

import Foundation

class ClassRoster {
    
    
    private var entries = [student]()
    
    var count: Int {
        return entries.count
    }
    
    init(entries: [student]) {
        self.entries = entries
    }
    
    func addEntry(entry: student) {
        entries.append(entry)
    }
    func entry(index:Int) -> student? {
        if index >= 0 && index < count {
            return entries[index]
        } else {
            return nil
        }
    }
}