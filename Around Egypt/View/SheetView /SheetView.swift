//
//  SheetView.swift
//  Around Egypt
//
//  Created by Tala Sadeq on 12/20/23.
//

import SwiftUI
struct SheetView: View {
    @State var imageId = ""
    var body: some View {

                ZStack {
                    Image("img") // Replace "your_image_name" with your actual image name
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300) // Adjust the frame size as needed
                    
                    VStack(alignment: .leading, spacing: 4){
                        Spacer()
                        HStack {
                            Text("AbuSimbel jj").fontWeight(.bold)
                                .font(.custom("Gotham", size: 16))
                            Spacer()
                            Spacer()
                            Button(action: {
                                // Action for the second button
                            }) {
                                Image("share") // Replace "your_image_name" with your actual image name
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 16.5, height: 16.5)
                                    
                                    
                            }
                            
                            Button(action: {
                                // Like a button
                            }) {
                                Image(systemName: "heart") // SF Symbol for heart
                                    .foregroundColor(Color("ColorOrange"))
                                    
                            }
                            Text("130")
                            
                          
                        }
                        
                        Text("Egypt")
                            .font(.custom("Gotham", size: 16))
                            .foregroundColor(Color("ColorGray"))
                        Divider()
                        Text("Description").fontWeight(.bold)
                        Text("The Abu Simbel temples are two massive rock temples at Abu Simbel, a village in Nubia, southern Egypt, near the border with Sudan. They are situated on the western bank of Lake Nasser, about 230 km southwest of Aswan (about 300 km by road). The twin temples were originally carved out of the mountainside in the 13th century BC, during the 19th dynasty reign of the Pharaoh Ramesses II. They serve as a lasting monument to the king and his queen Nefertari, and commemorate his victory at the Battle of Kadesh. Their huge external rock relief figures have become iconic.")
                    }
                }
            }
        }


struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
