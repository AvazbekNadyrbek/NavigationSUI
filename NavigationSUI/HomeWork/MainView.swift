//
//  MainView.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 29.07.25.
//

import SwiftUI

struct MainView: View {
    
    @Binding var path: [Page]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .center, spacing: 40) {
                    HStack(alignment: .center, spacing: 120) {
                        Text("instaPocket")
                            .font(.title.bold())
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "gear")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: 44, height: 44)
                                .contentShape(Rectangle())
                                .cornerRadius(8)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Today")
                            .font(.title2.bold())
                        CardView(image: .bigImgNav)
                            .onTapGesture {
                                path.append(.DetailsView)
                            }
                        CardView(image: .bigIMGNav2)
                            .onTapGesture {
                                path.append(.DetailsView)
                            }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .foregroundStyle(.white)
            .padding(.horizontal, 20)
        }
        
    }
}

#Preview {
    @State var previewPath: [Page] = []
    return MainView(path: $previewPath)
}
