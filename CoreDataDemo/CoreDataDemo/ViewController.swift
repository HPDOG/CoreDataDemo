//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by HPDOG on 2023/5/22.
//

import Cocoa
import CoreData

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(coreDataConnect.writeCoreData(name: "Tom"))
        print(coreDataConnect.writeCoreData(name: "John"))
        print(coreDataConnect.writeCoreData(name: "Sean"))
        print(coreDataConnect.writeCoreData(name: "May"))
        print(coreDataConnect.readCoreData(id: 1))
        print(coreDataConnect.readCoreData(id: 2))
        print(coreDataConnect.deleteCoreData(id: 1))
        print(coreDataConnect.readCoreData(id: 1))
        
        print(coreDataConnect.updateCoreData(id: 1,name:"Lucy"))
        print(coreDataConnect.readCoreData(id: 1))
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

