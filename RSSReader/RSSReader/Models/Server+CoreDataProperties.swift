//
//  Server+CoreDataProperties.swift
//  RSSReader
//
//  Created by Jenny Rykun on 12/6/18.
//  Copyright © 2018 Jenny Rykun. All rights reserved.
//
//

import Foundation
import CoreData


extension Server {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Server> {
        return NSFetchRequest<Server>(entityName: "Server")
    }

    @NSManaged public var address: URL?
    @NSManaged public var name: String?

}
