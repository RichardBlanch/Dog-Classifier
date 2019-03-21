//
//  ViewController.swift
//  DogClassifier
//
//  Created by Richard Blanchard on 3/20/19.
//  Copyright © 2019 Richard Blanchard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet private weak var containerStackView: UIStackView!
    @IBOutlet private weak var dogImageView: UIImageView!
    @IBOutlet private weak var dogImageViewAspectRatio: NSLayoutConstraint!
    @IBOutlet private weak var dogLabel: UILabel!
    @IBOutlet private weak var submitButton: UIButton!
    
    @IBAction func didTapSubmit(_ sender: UIButton) {
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
        
        present(imagePickerViewController, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)

        if let dogImage = info[.originalImage] as? UIImage, let pixelBuffer = dogImage.cvPixelBuffer {
            do {
                dogImageView.image = dogImage
                dogImageViewAspectRatio.constant = dogImage.size.width / dogImage.size.height

                UIView.animate(withDuration: 1.0) {
                    self.view.layoutIfNeeded()
                }
        
                
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
