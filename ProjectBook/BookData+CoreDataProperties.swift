//
//  BookData+CoreDataProperties.swift
//  ProjectBook
//
//  Created by Anvila on 01/11/23.
//
//

import Foundation
import CoreData


extension BookData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookData> {
        return NSFetchRequest<BookData>(entityName: "BookData")
    }

    @NSManaged public var author: String?
    @NSManaged public var date: Date?
    @NSManaged public var subjectname: String?
    @NSManaged public var title: String?

}

extension BookData : Identifiable {

}
