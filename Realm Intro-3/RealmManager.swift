//
//  RealmManager.swift
//  Realm Intro-2
//
//  Created by Stewart Lynch on 2022-03-08.
//

import Foundation
import RealmSwift

class RealmManager {
    private(set) var realm: Realm?
    init(name: String) {
        initializeSchema(name: name)
    }
    
    func initializeSchema(name: String) {
        let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let realmFileUrl = docDir.appendingPathComponent("\(name).realm")
        //see notes
        let config = Realm.Configuration(schemaVersion: 1) { migration, oldSchemaVersion in
            if oldSchemaVersion < 1 {
                migration.enumerateObjects(ofType: Country.className()) { _, newObject in
                    newObject!["flag"] = "🏳️"
                }
            }
        }
        Realm.Configuration.defaultConfiguration = config
        print(docDir.path)
        do {
            realm = try Realm()
        } catch {
            print("error loading default Realm:", error)
        }
    }
}
