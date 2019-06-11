//
//  Channel+CoreDataProperties.swift
//  CoreDataApp
//
//  Created by apple on 2019/6/11.
//  Copyright © 2019 OBFirm. All rights reserved.
//
//

import Foundation
import CoreData


extension Channel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Channel> {
        return NSFetchRequest<Channel>(entityName: "Channel")
    }

    @NSManaged public var subscriberCount: Int32
    @NSManaged public var title: String?
    @NSManaged public var viewCount: Int32

}
