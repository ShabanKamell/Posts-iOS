//
//  Post+CoreDataProperties.swift
//  
//
//  Created by mac on 9/28/19.
//
//

import Foundation
import CoreData


extension PostEntity {

    public class func fetchRequest() -> NSFetchRequest<PostEntity> {
        return NSFetchRequest<PostEntity>(entityName: "PostEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var body: String?
    @NSManaged public var title: String?

}
