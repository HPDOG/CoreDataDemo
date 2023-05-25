//
//  CoreDataConnect.swift
//  CoreDataDemo
//
//  Created by HPDOG on 2023/5/22.
//

import Cocoa
let coreDataConnect = CoreDataConnect()
class CoreDataConnect {

    private let coreDataContext = (NSApplication.shared.delegate
                as! AppDelegate).persistentContainer.viewContext
    
    func getCount() -> Int {
        do{
            let result = try coreDataContext.fetch(Record1.fetchRequest())
            for data in result {
                if let name = data.value(forKey: "name") as? String, let id = data.value(forKey: "id") as? Int {
                    print("id = \(id),  name = \(name)")
                }
                
            }
            return result.count
        }catch let error as NSError{
            print("getCount->\(error)")
        }
        return 0
    }
    
    func writeCoreData(name:String) -> Bool {
        let memberEntity = Record1(context: coreDataContext)
        memberEntity.id = NSDecimalNumber.init(value: getCount()+1)
        memberEntity.name = name
        memberEntity.createdate = Int(NSDate().timeIntervalSince1970).description
        
        do{
            try coreDataContext.save()
            return true
        }catch let error as NSError{
            print("read->\(error)")
            return false
        }
        
    }
    
    func readCoreData(id:Int) -> Array<Any> {
        let request : NSFetchRequest = Record1.fetchRequest()

        request.predicate = NSPredicate(format: "id = \(id) ")
        
        var arr = Array<Any>()
        
        do{
            let result = try coreDataContext.fetch(request)
            for data in result {
                let dic = NSMutableDictionary()
                
                if let name = data.value(forKey: "name") as? String {
                    dic.setObject(name, forKey: "name" as NSCopying)
                    dic.setObject(data.value(forKey: "createdate") as! String, forKey: "createdate" as NSCopying)
                    dic.setObject(data.value(forKey: "id") as! NSDecimalNumber, forKey: "id" as NSCopying)
                }
                arr.append(dic)
            }
        }catch let error as NSError{
            print("read->\(error)")
        }
        return arr
    }
    
    func deleteCoreData(id:Int) -> Bool {
        let request : NSFetchRequest = Record1.fetchRequest()
        
        request.predicate = NSPredicate(format: "id = \(id)")

        do{
            let result = try coreDataContext.fetch(request)
            for data in result {
                coreDataContext.delete(data)
            }
            try coreDataContext.save()
            return true
        }catch let error as NSError{
            print("read->\(error)")
            return false
        }
    }
    
    func updateCoreData(id:Int,name:String="") -> Bool {
        let request : NSFetchRequest = Record1.fetchRequest()
        if name==""{
            return false
        }
        request.predicate = NSPredicate(format: "id = \(id)")

        do{
            let result = try coreDataContext.fetch(request)
            for data in result {
                data.name = name
                data.createdate = Int(NSDate().timeIntervalSince1970).description
            }
            try coreDataContext.save()
            return true
        }catch let error as NSError{
            print("read->\(error)")
            return false
        }
    }
}
