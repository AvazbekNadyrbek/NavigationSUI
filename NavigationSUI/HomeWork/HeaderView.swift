//
//  HeaderView.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 30.07.25.
//

import SwiftUI

struct HeaderView: View {
    
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        HStack(alignment: .center, spacing: 100) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.turn.down.left")
                    .font(.title2)
            }
            VStack(alignment: .center) {
                Text("16 декабря")
                    .font(.title2.bold())
                Text("2025 год")
            }
            Image(systemName: "text.line.magnify")
                .font(.title2)
        }
        .foregroundStyle(.white)
        .padding(.top, 20)
    }
        
}

#Preview {
    HeaderView()
}
