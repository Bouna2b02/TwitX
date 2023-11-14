//
//  TopBar.swift
//  twitter-clone (iOS)
//
//

import SwiftUI

struct TopBar: View {
    
    @Binding var x : CGFloat
    @State var width = UIScreen.main.bounds.width
    
    var body: some View {
        
        //SearchBar().frame(width: UIScreen.main.bounds.width - 120)
        
        
        VStack {
            HStack {
                
                Button(action: {
                    
                    // opening menu,...
                    
                    withAnimation{
                        
                        x = 0
                    }
                    
                }) {
                    
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 24))
                        .foregroundColor(Color("twitter"))
                }
                
                Spacer(minLength: 0)
                
                Image("Twitter")
                    .resizable()
                    .scaledToFill()
                    .padding(.trailing)
                    .frame(width: 20, height: 20)
                
                //                Text("Twitter")
                //                    .fontWeight(.bold)
                //                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
            }
            .padding()
            
            //.padding(.top, 20)
            
            //.shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 1)
            
            Rectangle()
                .frame(width: width, height: 1)
                .foregroundColor(.gray)
                .opacity(0.3)
        }
        
        .background(Color.white)
        
    }
}
