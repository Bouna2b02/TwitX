//
//  ImagePicker.swift
//  twitter-clone (iOS)
//
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var mode
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else { return }
            self.parent.image = image
            self.parent.mode.wrappedValue.dismiss()
        }
        
    }
}




//import PhotosUI
//
//struct ImagePicker : UIViewControllerRepresentable {
//
//    @Binding var picker : Bool
//    @Binding var imageData : Data
//
//    func makeCoordinator() -> Coordinator {
//        return ImagePicker.Coordinator(parent: self)
//    }
//
//    func makeUIViewController(context: Context) -> PHPickerViewController {
//
//        var config = PHPickerConfiguration()
//        config.selectionLimit = 1
//
//        let controller = PHPickerViewController(configuration: config)
//
//        controller.delegate = context.coordinator
//
//        return controller
//    }
//
//    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
//
//
//    }
//
//    class Coordinator : NSObject,PHPickerViewControllerDelegate{
//
//        var parent : ImagePicker
//
//        init(parent : ImagePicker) {
//            self.parent = parent
//        }
//
//        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//
//            if results.isEmpty{
//                self.parent.picker.toggle()
//                return
//            }
//
//            let item = results.first!.itemProvider
//
//            if item.canLoadObject(ofClass: UIImage.self){
//
//                item.loadObject(ofClass: UIImage.self) { (image, err) in
//                    if err != nil{return}
//
//                    let imageData = image as! UIImage
//
//                    DispatchQueue.main.async {
//                        self.parent.imageData = imageData.jpegData(compressionQuality: 0.5)!
//                        self.parent.picker.toggle()
//                    }
//                }
//            }
//        }
//    }
//}
//
