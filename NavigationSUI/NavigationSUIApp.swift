//
//  NavigationSUIApp.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 27.07.25.
//

import SwiftUI

enum Page: Hashable {
    case Second(Int)
    case Profile(String)
    case Setting
}

@main
struct NavigationSUIApp: App {
    
    @State var path: [Page] = []
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                ContentView(path: $path)
                    .navigationDestination(for: Page.self) { page in
                        // page its path (url)
                        // and passing the argument
                        
                        switch page {
                        case .Profile(let nameProfile):
                            ProfilePage(name: nameProfile)
                        case .Second(let pageNumber):
                            SecondPage(pageNumber: pageNumber, path: $path)
                        case .Setting:
                            SettingsPage()
                        }
                    }
            }
            
        }
    }
}
