//
//  Realm_Intro_3App.swift
//  Realm Intro-3
//
//  Created by Stewart Lynch on 2022-03-07.
//

import SwiftUI

@main
struct Realm_Intro_3App: App {
    @StateObject var realmManager = RealmManager(name: "exampleTRee")
    var body: some Scene {
        WindowGroup {
            TabView {
                CountriesListView()
                    .tabItem {
                        Label("Countries", systemImage: "list.dash")
                    }
                    .environmentObject(realmManager)
                AllCitiesListView()
                    .tabItem {
                        Label("Cities", systemImage: "list.dash")
                    }
                
            }
            .onAppear {
                //                print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            }
        }
    }
}

/**
 edit this boilerplate using: cmd + shift + L
 --------------------------
 NOTES:
 10.9
 Main differences btwn this project and what it's continuing (Realm-Intro-2: otherwise identical)
 referencing: CountriesListView
 
 1. He added a searchable control to search on our list of countries
 .searchable(text: $searchFilter,collection: $countries, keyPath: \.name, placement: .navigationBarDrawer(displayMode: .always)) {
 ForEach(countries) { country in
 Text(country.name)
 .searchCompletion(country.name)
 }
 }
 
 2. He removed the textfield telling user to hit the "plus" button to add a new country. I'm unsure why
 3. added a searchFilter state var to aide w the above
 @State private var searchFilter = ""
 
 referencing AllCitiesListView
 
 4. he added a countryFlag to the row view
 
 referencing: CountryRowView
 
 5. added an auto-capitalization modifier to text field
 
 referencing: Assets
 
 6. added new icon & launch screen for the simulator - so we know we're not running the older version (realm-intro-2)
 
 --------------------------
 10.11
 //that hidden print statement you were lookin for
 //replaces old print statement in AppEntry file
 print(docDir.path)
 
 --------------------------
 10.12
 restarting w fresh Lynch download starter - simulator was misbehaving for an unfamiliar error
 
 --------------------------
 10.13
 REALMFILEURL USEAGE
 see RealmManager & AppEntry
 let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
 let realmFileUrl = docDir.appendingPathComponent("\(name).realm")
 let config = Realm.Configuration(fileURL: realmFileUrl, schemaVersion: 1) { migration, oldSchemaVersion in
 //gives each back-end realm instance we create a unique name id appended to the default realm file url path
 
 DELETING FILE URL PATH PRINT STATEMENT
 print(docDir.path)
 deleted: print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
 // since we're printing each realm instance's unique path in RealmManager, we've deleted the OG, more generic print statemnent from AppEntry
 
 CHANGING REALMMANGER TO AN OBSERVABLE OBJECT W A UNIQUE NAME
 let realmManager = RealmManager()
 changed to: @StateObject var realmManager = RealmManager(name: "example3")
 //so we made class REalmManager an Observable object...
 //to then set an instance of it as an @StateObject (to be observed) while accounting for the new "name" param
 //we finally inject said instance into the environment of our CountriesListView (not usihng it on AllCitiesListView)
 
 10.16
 crashing - getting file not found error when running realm schema versions 1 & 2
 i even changed the default filepath name to example3 in my finder, still nada.
 
 10.17
 freed up storage space but app still crashing at the try! in the SwiftUI file - what's going on?
 testing new token
 
 --------------------------
 */
