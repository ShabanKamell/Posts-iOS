//
//  Post+CoreDataClass.swift
//  
//
//  Created by mac on 9/28/19.
//
//

import Foundation
import CoreData
import RxSwift
import Core

@objc(PostEntity)
public class PostEntity: NSManagedObject {

    static var name = String(describing: PostEntity.self)

    public class func saveItems(items : [PostResponse]){
        items.forEach{ saveItem(item: $0) }
    }

    public class func saveItem(item: PostResponse) {
        let obj = NSEntityDescription.insertNewObject(
                forEntityName: name,
                into: managedContext()!
        ) as? PostEntity
        if let obj = obj {
            obj.title = item.title
            obj.body = item.body
            try? managedContext()?.save()
        }
    }
    
    public class func items(pagingInfo: PagingInfo) -> Observable<[PostResponse]>{
        let ps = PublishSubject<[PostResponse]>()

        managedContext()?.perform {
            let request: NSFetchRequest<PostEntity> = PostEntity.fetchRequest()
            request.fetchOffset = pagingInfo.start
            request.fetchLimit = pagingInfo.limit

            var items: [PostEntity] =  []
            do {
                items = try managedContext()?.fetch(request) ?? []
            } catch let error {
                print(error.localizedDescription)
                ps.onError(error)
            }
            ps.onNext(items.map {
                PostResponse(
                        id: Int(truncatingIfNeeded: $0.id),
                        title: $0.title!,
                        body: $0.body!
                )
            })
        }
        return ps
    }
    
    public class func managedContext() -> NSManagedObjectContext?  {
         (UIApplication.shared.delegate as? CoreAppDelegate)?.persistentContainer.viewContext
    }
}
