//
//  Extensions.swift
//  twitter-clone (iOS)
//
//  Created by cem on 8/28/21.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
