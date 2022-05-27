import UIKit

extension SignUpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Image Picker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else {
            print("no image")
            return
        }
        
        if ccommericalRegBtn.isEnabled == false {
            commericalRegImg = image
           print("commericalImg")
            ccommericalRegBtn.isEnabled = true
        }
        else if licenseBtn.isEnabled == false {
            licenseImg = image
            print("license")
            licenseBtn.isEnabled = true
        }
    }
    
    // MARK: - Cancelling Image Picker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.ccommericalRegBtn.isEnabled = true
        self.licenseBtn.isEnabled = true
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Source to Get Photo (Camera/Photo Library)
    func getPhoto(type: UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    // MARK: - Alert Method to Choose Source Type (Camera/Photo Library)
    func showPhotoAlert(){
        let alert = UIAlertController(title: "Take Photo From:", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            self.getPhoto(type: .camera)
        }))
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { action in
            self.getPhoto(type: .photoLibrary)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            self.ccommericalRegBtn.isEnabled = true
            self.licenseBtn.isEnabled = true
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
}
