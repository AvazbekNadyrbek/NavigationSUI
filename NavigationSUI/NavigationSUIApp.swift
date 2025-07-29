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
    case ContentView
    case DetailsView
}

@main
struct NavigationSUIApp: App {
    
    @State var path: [Page] = []
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                MainView(path: $path)
                    .navigationDestination(for: Page.self) { page in
                        switch page {
                        case .Profile(let nameProfile):
                            ProfilePage(name: nameProfile)
                        case .Second(let pageNumber):
                            SecondPage(pageNumber: pageNumber, path: $path)
                        case .Setting:
                            SettingsPage()
                        case .ContentView:
                            ContentView(path: $path)
                        case .DetailsView:
                            DetailsView()
                        }
                    }
            }
        }
    }
}