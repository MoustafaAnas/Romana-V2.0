import UIKit

extension AddProductVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Action After Picking Image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else {
            print("no image")
            return
        }
        uploadImgBtn.setImage(image, for: .normal)
        print("upload \(image)")
    }
    
    // MARK: - Action After Cancellling Image Picker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Getting Photo From (Camera/Photo Library)
    func getPhoto(type: UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
}
