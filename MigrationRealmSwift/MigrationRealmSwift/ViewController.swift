//
//  ViewController.swift
//  MigrationRealmSwift
//
//  Created by Boss on 02/09/2021.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var realm = try! Realm()
    var listItem: Results<Model> {
        get {
            return realm.objects(Model.self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func registerTableView() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.separatorStyle = .none
    }
    
    // Mark: Action
    @IBAction func onCLickAdd(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailVC") as! DetailVC
        title = ""
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.nameLabel.text = listItem[indexPath.row].fullname
        cell.ageLabel.text = "\(listItem[indexPath.row].age)"
        return cell
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            try! self.realm.write {
                self.realm.delete(listItem[indexPath.row])
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailVC") as! DetailVC
        title = ""
        vc.model = listItem[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

