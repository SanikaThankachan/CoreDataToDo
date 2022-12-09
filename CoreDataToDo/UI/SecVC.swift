//
//  SecVC.swift
//  CoreDataToDo
//
//  Created by Zakkariya K.A on 08/12/22.
//story board id = secondViewController

import UIKit

class SecVC: UIViewController {

    var model: Model?
    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        if textfield.text != ""{
            model!.createItem(name: textfield.text!)
            navigationController?.popViewController(animated: true)
        }
        else
        {
            let alert = UIAlertController(title: "This is an alert", message: "leave?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .cancel))
            present(alert, animated: true)
            
            
        }
    }

}
