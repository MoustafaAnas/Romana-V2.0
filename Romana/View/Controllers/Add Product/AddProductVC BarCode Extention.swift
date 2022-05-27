import UIKit
import AVFoundation

extension AddProductVC: AVCaptureMetadataOutputObjectsDelegate {

        func customizeBarCode() {
        

        // Allow the view to resize freely
        self.highlightView.autoresizingMask = UIView.AutoresizingMask.flexibleTopMargin

        // Select the color you want for the completed scan reticle
        self.highlightView.layer.borderColor = UIColor.gray.cgColor
        self.highlightView.layer.borderWidth = 3

        // Add it to our controller's view as a subview.
        self.view.addSubview(self.highlightView)

        // For the sake of discussion this is the camera
            let device = AVCaptureDevice.default(for: AVMediaType.video)

        // Create a nilable NSError to hand off to the next method.
        // Make sure to use the "var" keyword and not "let"

            do {
        let input : AVCaptureDeviceInput? = try AVCaptureDeviceInput(device: device!)
                // If our input is not nil then add it to the session, otherwise we're kind of done!
                if let input = input {
                    session.addInput(input)
                }
            } catch {
            // This is fine for a demo, do something real with this in your app. :)
            print(error)
         }

        let output = AVCaptureMetadataOutput()
            output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        session.addOutput(output)
        output.metadataObjectTypes = output.availableMetadataObjectTypes

            previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = self.view.bounds
            previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.addSublayer(previewLayer)

        // Start the scanner. You'll have to end it yourself later.
        session.startRunning()
    }

    // This is called when we find a known barcode type with the camera.
    func captureOutput(
         captureOutput: AVCaptureOutput,
         didOutputMetadataObjects metadataObjects: [AnyObject],
         fromConnection connection: AVCaptureConnection,
         barCodeType: [AVMetadataObject.ObjectType]) -> String? {

       var detectionString: String?
       var highlightViewRect = CGRect()
       let barCodeTypes = barCodeType
       if let metadataObject = metadataObjects.first {
             for barcodeType in barCodeTypes {
                 if metadataObject.type == barcodeType {
                   guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return String()}
                   guard let barCodeObject = self.previewLayer.transformedMetadataObject(for: readableObject) else { return String()}
                   highlightViewRect = barCodeObject.bounds
                   detectionString = readableObject.stringValue
                  
                   self.session.stopRunning()
                     break
                 }
             }
         }

       self.highlightView.frame = highlightViewRect
       self.view.bringSubviewToFront(self.highlightView)
       return detectionString
     }
    

    func alert(Code: String){
        let actionSheet:UIAlertController =
            UIAlertController(
                title: "Barcode",
                message: "\(Code)",
                preferredStyle: UIAlertController.Style.alert)

        // for alert add .Alert instead of .Action Sheet
        // start copy
        let firstAlertAction:UIAlertAction =
            UIAlertAction(
                title: "OK",
                style: UIAlertAction.Style.default,
                handler: { (alertAction: UIAlertAction!) in
                // action when pressed
                self.session.startRunning()
        })

        actionSheet.addAction(firstAlertAction)
        // end copy
        self.present(actionSheet, animated: true, completion: nil)
    }
}
