//
//  CustomProfileTextField.swift
//  twitter-clone (iOS)
//
//  Created by cem on 12/7/21.
//

import SwiftUI

struct CustomProfileTextField: View {
    
    @Binding var message: String
    var placeholder: String
    
    var body: some View {
        HStack {
            ZStack {
                HStack {
                    if message.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                
                TextField("", text: $message)
                    .foregroundColor(.blue)
            }
        }
    }
}

