//
//  DetailVC.swift
//  MigrationRealmSwift
//
//  Created by Boss on 02/09/2021.
//

import UIKit
import RealmSwift

class DetailVC: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextFiled: UITextField!
    
    let realm = try! Realm()
    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create"
        check()
        
    }
    
    func check() {
        if model.fullname != "" {
            nameTextField.text = model.fullname
            ageTextFiled.text = "\(model.age)"
        }
    }
    
    @IBAction func onClickCreate(_ sender: Any) {
        if model.fullname != "" {
            try! realm.write({
                let model = Model()
                model.fullname = nameTextField.text!
                model.age = Int(ageTextFiled.text!)!
                realm.add(model, update: .modified)
            })
        } else {
            model.fullname = nameTextField.text ?? ""
            model.age = Int(ageTextFiled.text!) ?? 0
            try! realm.write {
                self.realm.add(model)
            }
        }
        navigationController?.popViewController(animated: true)
    }

}
