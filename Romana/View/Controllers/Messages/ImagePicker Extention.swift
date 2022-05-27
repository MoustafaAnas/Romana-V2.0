import UIKit

extension MessagesVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Action After Picking Image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       dismiss(animated: true, completion: nil)
    
        guard let videoURL = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerReferenceURL") ] as? NSURL
        else {
        print("no image")
        return
        }
         print("upload \(videoURL)")
    }
    
    // MARK: - Action When Cancelling ImagePicker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Get Image From (Camera/Photo Library)
    func getPhoto(type: UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.allowsEditing = true
        picker.delegate = self
        picker.mediaTypes = ["public.image", "public.movie"]
        present(picker, animated: true, completion: nil)
    }
    
}
