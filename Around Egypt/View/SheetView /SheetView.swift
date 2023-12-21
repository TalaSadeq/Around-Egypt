//
//  SheetView.swift
//  Around Egypt
//
//  Created by Tala Sadeq on 12/20/23.
//

import SwiftUI
struct SheetView: View {
    @State var imageId = ""
    @State var description = ""
    @State var title = ""
    @State var likesNo : Int?
    @State var imageUrl = ""
    @State var city = " "
    
    
    var body: some View {
        ZStack {
            if let url = URL(string: imageUrl) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView() // Show a progress view while loading the image
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 300) // Adjust the frame size as needed
                    case .failure:
                        Image(systemName: "photo") // Placeholder image if loading fails
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "photo") // Placeholder image if URL is invalid
            }

            VStack(alignment: .leading, spacing: 4) {
                Spacer()
                HStack {
                    Text(title).fontWeight(.bold)
                        .font(.custom("Gotham", size: 16))
                    Spacer()
                    Spacer()
                    Button(action: {
                        // Action for the second button
                    }) {
                        Image("share")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 16.5, height: 16.5)
                    }

                    Button(action: {
                        // Like a button
                    }) {
                        Image(systemName: "heart")
                            .foregroundColor(Color("ColorOrange"))
                    }
                    Text(String(likesNo ?? 0))
                }

                Text(city)
                    .font(.custom("Gotham", size: 16))
                    .foregroundColor(Color("ColorGray"))
                Divider()
                Text("Description").fontWeight(.bold)
                Text(description)
            }
        }
    }
            }
        


struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}

