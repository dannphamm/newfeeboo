//
//  PicturesViewController.swift
//  FeeBoo
//
//  Created by Dung Pham on 5/24/17.
//  Copyright © 2017 Dung Pham. All rights reserved.
//

import UIKit
import FirebaseStorage
import Firebase

class PicturesViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var descriptionText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        
        imageView.backgroundColor = UIColor.clear
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        
        nextButton.isEnabled = false
        
        let imagesFolder = Storage.storage().reference().child("images")
        
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)
        
 
        
        
        imagesFolder.child("\(NSUUID().uuidString).jpg").putData(imageData!, metadata: nil, completion: {(metadata, error) in
            print("we tried to upload!")
            if error != nil {
                print("we had the an error:\(String(describing: error))")
            } else {
                
                print(metadata?.downloadURL()! as Any)
                
                self.performSegue(withIdentifier: "selectUsersSegue", sender: nil)
            }
        })
        
        
        
        
        
    }
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        
    }
    
}
