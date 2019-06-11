//
//  Video+CoreDataProperties.swift
//  CoreDataApp
//
//  Created by apple on 2019/6/11.
//  Copyright © 2019 OBFirm. All rights reserved.
//
//

import Foundation
import CoreData


extension Video {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Video> {
        return NSFetchRequest<Video>(entityName: "Video")
    }

    @NSManaged public var dislikeCount: Int16
    @NSManaged public var duration: String?
    @NSManaged public var id: Int16
    @NSManaged public var likeCount: Int32
    @NSManaged public var publishedAt: String?
    @NSManaged public var title: String?
    @NSManaged public var videoId: String?
    @NSManaged public var viewCount: Int32

}
