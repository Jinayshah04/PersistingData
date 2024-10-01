//
//  CoreDataManager.swift
//  PersistingData
//
//  Created by mobile1 on 27/09/24.
//

import CoreData
import UIKit

final class CoreDataManager{
    
    func addToCore(jokeObject:JokeModel){
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = delegate.persistentContainer.viewContext
        
        guard let jokeEntity = NSEntityDescription.entity(forEntityName: "Jokes", in: managedContext) else {return}
        
        let joke = NSManagedObject(entity: jokeEntity, insertInto: managedContext)
        
        joke.setValue(jokeObject.id, forKey: "id")
        joke.setValue(jokeObject.type, forKey: "type")
        joke.setValue(jokeObject.setup, forKey: "setup")
        joke.setValue(jokeObject.punchLine, forKey: "punchline")
        
        do{
            try managedContext.save()
                print("Saved to CoreData")
            }catch let err as NSError{
                print("Could not save data to Core : \(err)")
            }
    }
}
