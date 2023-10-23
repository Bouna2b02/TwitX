//
//  MultilineTextField.swift
//  Twitter-Clone
//
//  Created by Bouna Diallo on 21/10/2023.
//

import SwiftUI

struct MultilineTextField: UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent1: self)
    }
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = true
        textView.text = "Type Something" // Utilisez la valeur du texte lié
        textView.isUserInteractionEnabled = true
        textView.textColor = .gray
        textView.font = .systemFont(ofSize: 20)
        textView.delegate = context.coordinator // Définissez le coordinateur comme délégué
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        // Vous pouvez laisser cette méthode vide pour l'instant
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MultilineTextField
        
        init(parent1: MultilineTextField) {
            parent = parent1
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == .gray {
                textView.text = ""
                textView.textColor = .black
            }
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
}

struct MultilineTextField_Previews: PreviewProvider {
    @State static var sampleText = "Type something"
    
    static var previews: some View {
        MultilineTextField(text: $sampleText)
    }
}
