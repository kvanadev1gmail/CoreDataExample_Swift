//
//  TaskDetailViewController.swift
//  CoreData_Swift
//
//  Created by KVANA09 on 05/07/16.
//  Copyright © 2016 KVANA09. All rights reserved.
//

import UIKit
import CoreData

class TaskDetailViewController: UIViewController {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var task: Tasks? = nil

    
    
    @IBOutlet weak var taskTF: UITextField!
    
    @IBAction func cancelClicked(sender: AnyObject) {
        dismissViewController()
    }
    
    
    @IBAction func doneClicked(sender: AnyObject) {
        
        if task != nil{
            editTask()
        }else{
         createTask()
        }
        dismissViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if task != nil{
            taskTF.text = task?.desc
        }
    }
    
    

    func createTask(){
        
        let entityDescription = NSEntityDescription.entityForName("Tasks", inManagedObjectContext:managedObjectContext)
        let task = Tasks(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        task.desc = taskTF.text!
        do {
            try managedObjectContext.save()
            
        } catch _ {
            
        }
    }

    func editTask() {
        
        task?.desc = taskTF.text!
        do {
        try managedObjectContext.save()
        } catch _ {
            
        }
    }
    
    func dismissViewController(){
        navigationController?.popViewControllerAnimated(true)
    }
    

}
