//
//  CreateTweetView.swift
//  Twitter-Clone
//
//  Created by Bouna Diallo on 21/10/2023.
//

import SwiftUI

struct CreateTweetView: View {
    
    @State var text = ""
    
    var body: some View {
        VStack {
            HStack {
                Button (action: {
                    
                }, label: {
                    Text("Cancel")
                })
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("tweet").padding()
                })
                .background(Color("bg"))
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            MultilineTextField(text: $text)
        }
        .padding()
    }
}

struct CreateTweetView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTweetView()
    }
}
