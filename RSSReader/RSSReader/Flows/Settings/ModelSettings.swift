//
//  ModelSettings.swift
//  RSSReader
//
//  Created by Jenny Rykun on 12/6/18.
//  Copyright © 2018 Jenny Rykun. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol SettingsModelProtocol {
    func fetchServers() -> [Server]
}

class SettingsModel: NSObject {}

extension SettingsModel: SettingsModelProtocol {
    
    func fetchServers() -> [Server] {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        do {
            return try managedContext.fetch(Server.fetchRequest())
        } catch {
            return []
        }
    }
    
}
