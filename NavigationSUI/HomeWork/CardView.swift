//
//  CardView.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 29.07.25.
//

import SwiftUI

struct CardView: View {
    
    var image: ImageResource
    var tags: [String] = ["Природа", "Фото", "Красота"] // Make tags dynamic
    var photoCount: Int = 4
    var commentCount: Int = 2
    var description: String = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ...."
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300) // Reduced from 400 - better for cards
                .clipped()
            

            
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("\(photoCount) фотографии")
                    Text("\(commentCount) комментария")
                }
                .font(.title3)
                
                // Dynamic tags
                HStack {
                    ForEach(tags.prefix(3), id: \.self) { tag in // Limit to 3 tags
                        Text(tag)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 5)
                            .background(.gray.opacity(0.3))
                            .clipShape(Capsule())
                    }
                }
                
                Text(description)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2) // Limit lines for consistency
            }
            .padding()
        }
        .foregroundStyle(.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .contentShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    CardView(image: .bigImgNav)
}
