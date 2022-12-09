//
//  ViewController.swift
//  CoreDataToDo
//
//  Created by Zakkariya K.A on 08/12/22.
//

import UIKit

class ViewController: UIViewController {
    var model1 = Model()
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        model1.getAllItem()
        tableview.reloadData()
        model1.closure = {
            [weak self]in self?.tableview.reloadData()
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func addbuttn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! SecVC
        vc.model = model1.self
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model1.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! Cell
        cell.textLabel?.text = model1.list[indexPath.row].name
        return cell
    }
}
