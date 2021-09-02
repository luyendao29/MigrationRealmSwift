//
//  Model.swift
//  MigrationRealmSwift
//
//  Created by Boss on 02/09/2021.
//

import RealmSwift

class Model: Object {
    @objc dynamic var fullname = ""
    @objc dynamic var age = 0
    override static func primaryKey() -> String? {
        return "fullname"
    }
}
