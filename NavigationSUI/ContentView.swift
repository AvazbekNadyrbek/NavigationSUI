//
//  ContentView.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 27.07.25.
//

import SwiftUI



struct ContentView: View {
    
    @Binding var path: [Page]
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Divider()
            
            ForEach(0...10, id: \.self) { page in
                //NavigationLink("to page -> \(page)", value: page)
                Button {
                    path.append(.Second(page))
                } label: {
                    Text("to page -> \(page)")
                }
                
            }
            
            Divider()
            
            Button{
                path.append(.Profile("Avazbek"))
            } label: {
                Text("Go to profile page")
            }
            
            Button {
                path.append(.Setting)
            } label: {
                Text("Go to setting page")
                    .foregroundStyle(.red)
            }
            
            
        }
        .padding()
        
    }
}


//#Preview {
//    ContentView(path: Setting)
//}

struct SecondPage: View {
    
    var pageNumber: Int = 0
    @State var text: String = ""
    @Binding var path: [Page]
    
    init(pageNumber: Int, path: Binding<[Page]>) {
        self.pageNumber = pageNumber
        self._path = path
        print(pageNumber)
    }
    
    var body: some View {
        VStack{
            Text("This is page: \(pageNumber)")
            
            Button {
                path.append(.Setting)
            } label: {
                Text("Back")
            }

        }
    }
}

struct ProfilePage: View {
    
    var name: String
    
    var body: some View {
        Text("Profile Page, my name is \(name)")
    }
}

struct SettingsPage: View {
    var body: some View {
        Text("Settings Page, path number is 11")
    }
}
