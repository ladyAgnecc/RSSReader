//
//  ServerModel.swift
//  RSSReader
//
//  Created by Jenny Rykun on 12/7/18.
//  Copyright © 2018 Jenny Rykun. All rights reserved.
//

import UIKit
import CoreData

protocol ServerModelProtocol {
    
    func addServer(name: String, link: URL, completition: ((Bool) -> Void))
    
}

class ServerModel: NSObject {}

extension ServerModel: ServerModelProtocol {
    
    func addServer(name: String, link: URL, completition: ((Bool) -> Void)) {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Server", in: managedContext)!
        
        let server = NSManagedObject(entity: entity, insertInto: managedContext) as! Server
        server.name = name
        server.address = link
        
        do {
            try managedContext.save()
            completition(true)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            completition(false)
            
        }
        
    }
}
