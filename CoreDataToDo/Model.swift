//
//  Model.swift
//  CoreDataToDo
//
//  Created by Zakkariya K.A on 08/12/22.
//

import Foundation
import UIKit

class Model{
    var closure: (()->Void)?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var list = [ToDoListItem]()

    func getAllItem(){
        do{
            list = try context.fetch(ToDoListItem.fetchRequest())
            closure?()
        }
        catch{}
    }
    func createItem(name: String){
        let tododetails = ToDoListItem(context: context)
        tododetails.name = name
        do{
            try context.save()
            getAllItem()
        }
        catch{}
        
    }
    func deleteItem(item : ToDoListItem){
        context.delete(item)
        do{
            try context.save()
            getAllItem()
        }
        catch{}
        
    }
    func updateItem(name:String,item:ToDoListItem){
        item.name = name
        do{
            try context.save()
        }
        catch{}
    }
    
}
