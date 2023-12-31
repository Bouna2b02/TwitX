//
//  SecureAuthTextField.swift
//  twitter-clone (iOS)
//
//

import SwiftUI

struct SecureAuthTextField: View {
    
    var placeHolder: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            
            ZStack(alignment: .leading) {
                
                if text.isEmpty {
                    Text(placeHolder)
                        .foregroundColor(.gray)
                }
                
                SecureField("", text: $text)
                    .frame(height: 45)
                    .foregroundColor(Color(red: 29 / 255, green: 161 / 255, blue: 242 / 255))
            }
            
            
            Rectangle()
                .frame(height: 1, alignment: .center)
                .foregroundColor(.gray)
                .padding(.top, -2)
                
        }
        .padding(.horizontal)
    }
}

