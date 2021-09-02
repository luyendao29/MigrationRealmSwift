//
//  AppDelegate.swift
//  MigrationRealmSwift
//
//  Created by Boss on 02/09/2021.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let mySchemaVersion = 6
        Realm.Configuration.defaultConfiguration = Realm.Configuration(
                    schemaVersion: UInt64(mySchemaVersion),
                    migrationBlock: { (migration, oldSchemaVersion) in
                        migration.enumerateObjects(ofType: Model.className(), {
                            (oldObject, newObject) in
//                            newObject?["fullname"] = oldObject?["name"]
                        })
                })
        
        Realm.Configuration.defaultConfiguration = Realm.Configuration(
                    schemaVersion: UInt64(mySchemaVersion),
                    migrationBlock: { (migration, oldSchemaVersion) in
//                        migration.renameProperty(onType: Model.className(), from: "name", to: "fullname")
                })
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

