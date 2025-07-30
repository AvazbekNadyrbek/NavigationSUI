//
//  SettingsView.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 30.07.25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(spacing: 0) {
            // your custom header at the top
            HeaderView()
            
            // scrollable settings content
            ScrollView {
                VStack(spacing: 12) {
                    SettingRowArrow(title: "Изменить пароль")
                    SettingRowArrow(title: "Удалить все")
                    SettingRowView(title: "Доступ к локации", isOn: true)
                }
                .padding()
            }
        }
        // background fills the full safe area
        .background(Color.black.ignoresSafeArea().opacity(0.8))
        // hide any default nav bar if you're inside a NavigationStack
        .navigationBarHidden(true)
    }
        
}

struct SettingRowView: View {
    let title: String
    @State var isOn: Bool
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Toggle("", isOn: $isOn)
        }
        .padding()
        .background(Color.black)
        .cornerRadius(20)
        .foregroundStyle(.white)
    }
}

struct SettingRowArrow: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        .background(Color.black)
        .cornerRadius(20)
        .foregroundStyle(.white)
    }
}

#Preview {
    SettingsView()
}
