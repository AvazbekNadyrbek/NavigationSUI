//
//  DetailsView.swift
//  NavigationSUI
//
//  Created by Авазбек Надырбек уулу on 29.07.25.
//

import SwiftUI

struct DetailsView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let images: [ImageResource] = [.bigIMGNav2, .bigImgNav]
    @State private var currentIndex = 0
    @State private var addComment: String = ""
    
    // Constants for better maintainability
    private let cardCornerRadius: CGFloat = 20
    private let cardMinHeight: CGFloat = 120
    private let standardPadding: CGFloat = 20
    private let tags = ["Природа", "Фотография", "Путешествия", "Искусство"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Header
                headerView
                Spacer()
                // Image Carousel
                imageCarousel
                
                // Tags
                tagsScrollView
                
                // Content Cards
                contentCards
                
                // Comment TextField
                commentTextField
            }
            .padding(.bottom, 20)
        }
        .background(Color.black.opacity(0.8))
        .navigationBarBackButtonHidden(true)
    }
    
    private var headerView: some View {
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
    
    private var imageCarousel: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 280, height: 400)
                        .clipShape(RoundedRectangle(cornerRadius: cardCornerRadius))
                        .id(index)
                        .onTapGesture {
                            currentIndex = index
                        }
                }
            }
            .padding(.horizontal, standardPadding)
        }
        .scrollTargetBehavior(.paging)
    }
    
    private var tagsScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.gray.opacity(0.4))
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                }
            }
            .padding(.horizontal, standardPadding)
        }
    }
    
    private var contentCards: some View {
        VStack(spacing: 16) {
            InfoCard(
                title: "Описание",
                description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod temporincididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
            )
            
            InfoCard(
                title: "16.12.23",
                description: "Ut enim ad minim veniam, quis nostrud exercit ation ullamco laboris nisi"
            )
            
            InfoCard(
                title: "16.12.23",
                description: "Ut enim ad minim veniam, quis nostrud exercit ation ullamco laboris nisi"
            )
        }
        .padding(.horizontal, standardPadding)
    }
    
    private var commentTextField: some View {
        TextField("Добавить комментарий", text: $addComment)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(cardCornerRadius)
            .padding(.horizontal, standardPadding)
        
    }
}

struct InfoCard: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
            Text(description)
                .font(.body)
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity, minHeight: 120, alignment: .topLeading)
        .background(Color.black)
        .cornerRadius(20)
    }
}

#Preview {
    DetailsView()
}
