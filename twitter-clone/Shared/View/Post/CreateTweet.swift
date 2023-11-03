//
//  CreateTweet.swift
//  twitter-clone (iOS)
//
//  Created by cem on 8/1/21.
//

import SwiftUI
import Kingfisher

struct CreateTweet : View {
    @ObservedObject var viewModel = CreateTweetViewModel()
    
    @Binding var show : Bool
    let user: User

    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var text = ""
    @State var imagePickerRepresented = false
    @State var width = UIScreen.main.bounds.width

    var body : some View {

        VStack{
            
            HStack{
                
                Button(action: {
                        
                    self.show.toggle()
                    
                }) {
                    
                    Text("Cancel")
                }
                
                Spacer()
                
                Button(action: {
                    
                    self.viewModel.uploadPost(text: text, image: selectedImage)
                    
                    self.show.toggle()
                    
                }) {
                    
                    Text("Tweet").padding()
                    
                }.background(Color("bg"))
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            
            HStack {
                VStack {
                    KFImage(URL(string: "http://localhost:3000/users/\(self.user.id)/avatar"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(.leading, 4)
                    
                    Spacer()
                }
                MultilineTextField(text: $text)
            }
            
            if postImage == nil {
                
                Button {
                    self.imagePickerRepresented.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipped()
                        .padding(.top)
                        .foregroundColor(.black)
                }.sheet(isPresented: $imagePickerRepresented) {
                    loadImage()
                } content: {
                    ImagePicker(image: $selectedImage)
                }
                
            }
            
            else if let image = postImage {
                VStack {
                    HStack(alignment: .top) {
                        image
                            .resizable()
                            .scaledToFill()
                            .padding(.horizontal)
                            .frame(width: width * 0.9)
                            .cornerRadius(16)
                            .clipped()
                        
                        
                    }
                    .padding()
                    
                    Spacer()
                }
            }
            
        }.padding()
    }
}

extension CreateTweet {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

