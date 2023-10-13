//
//  Realm_Intro_3App.swift
//  Realm Intro-3
//
//  Created by Stewart Lynch on 2022-03-07.
//

import SwiftUI

@main
struct Realm_Intro_3App: App {
    let migrator = RealmManager()
    var body: some Scene {
        WindowGroup {
            TabView {
                CountriesListView()
                    .tabItem {
                        Label("Countries", systemImage: "list.dash")
                    }
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
 see RealmManager
 let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
 let realmFileUrl = docDir.appendingPathComponent("\(name).realm")
 //gives each back-end realm instance we create a unique name id appended to the default realm file url path
 
 print(docDir.path)
 deleted: print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
 // since we're printing each realm instance's unique path in RealmManager, we've deleted the OG, more generic print statemnent from AppEntry
 
 --------------------------
 */
