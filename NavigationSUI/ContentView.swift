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
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Main Page")
                .font(.title2)
                .fontWeight(.bold)
            
            Divider()
            
            // Список страниц
            Text("Navigate to Second Pages:")
                .font(.headline)
                .foregroundColor(.secondary)
            
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(0...10, id: \.self) { page in
                        Button {
                            path.append(.Second(page))
                        } label: {
                            HStack {
                                Text("Page \(page)")
                                Spacer()
                                Image(systemName: "arrow.right")
                            }
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                        }
                        .foregroundColor(.primary)
                    }
                }
            }
            .frame(maxHeight: 200)
            
            Divider()
            
            // Основные разделы
            VStack(spacing: 12) {
                Button {
                    path.append(.Profile("Avazbek"))
                } label: {
                    HStack {
                        Image(systemName: "person.circle")
                        Text("Go to Profile")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(8)
                }
                .foregroundColor(.primary)
                
                Button {
                    path.append(.Setting)
                } label: {
                    HStack {
                        Image(systemName: "gear")
                        Text("Go to Settings")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding()
                    .background(Color.orange.opacity(0.1))
                    .cornerRadius(8)
                }
                .foregroundColor(.primary)
            }
            
            // Отладочная информация
            if !path.isEmpty {
                Divider()
                Text("Current path depth: \(path.count)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .navigationTitle("Navigation Demo")
    }
}

struct SecondPage: View {
    
    var pageNumber: Int = 0
    @State var text: String = ""
    @Binding var path: [Page]
    
    init(pageNumber: Int, path: Binding<[Page]>) {
        self.pageNumber = pageNumber
        self._path = path
        print("📱 Navigated to page: \(pageNumber)")
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Page Number: \(pageNumber)")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Path depth: \(path.count)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Divider()
            
            // Навигация дальше
            Button {
                path.append(.Setting)
            } label: {
                Text("Go to Settings")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            // Навигация к профилю
            Button {
                path.append(.Profile("User from Page \(pageNumber)"))
            } label: {
                Text("Go to Profile")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Divider()
            
            // Различные способы возврата
            VStack(spacing: 12) {
                Text("Navigation Controls:")
                    .font(.headline)
                
                Button {
                    // Вернуться на одну страницу назад
                    if !path.isEmpty {
                        path.removeLast()
                    }
                } label: {
                    Text("Back (Remove Last)")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button {
                    // Вернуться к корню
                    path.removeAll()
                } label: {
                    Text("Back to Root")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .navigationTitle("Page \(pageNumber)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfilePage: View {
    
    var name: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.blue)
            
            Text("Profile Page")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Welcome, \(name)!")
                .font(.title2)
                .foregroundColor(.secondary)
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                Text("Dismiss (Environment)")
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingsPage: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "gear")
                .font(.system(size: 80))
                .foregroundColor(.orange)
            
            Text("Settings Page")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Configure your app settings here")
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Divider()
            
            VStack(spacing: 12) {
                SettingRow(title: "Notifications", isOn: true)
                SettingRow(title: "Dark Mode", isOn: false)
                SettingRow(title: "Location", isOn: true)
            }
        }
        .padding()
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingRow: View {
    let title: String
    @State var isOn: Bool
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Toggle("", isOn: $isOn)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}