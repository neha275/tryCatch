//
//  ViewController.swift
//  trycatch
//
//  Created by Neha on 29/1/2023.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlet's -
    @IBOutlet weak var uvPaswordBorder: UIView!
    @IBOutlet weak var txtPassword: UITextField!

    // MARK: - View Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        uvPaswordBorder.layer.borderWidth = 1
        uvPaswordBorder.layer.borderColor = UIColor.black.cgColor
        uvPaswordBorder.layer.cornerRadius = 10
    }
    // MARK: - IBAction -
    @IBAction func onbtnSumbit(_ sender: UIButton) {
        tryUses()
//        tryOptionalUses()
//        tryValuesUses()
    }

    // MARK: - Helper -

    func tryUses() {
        do {
            let objValidationViewModel = ValidationViewModel()
            try objValidationViewModel.validatePassword(password: txtPassword.text!)
        } catch {
            switch error {
            case PasswordError.passwordShort:
                print("Minimum 8 character is required.")
            case PasswordError.numericRequired:
                print("1 Numeric value is required.")
            case PasswordError.specialCharaterRequired:
                print("1 special symbol is required.")
            default:
                break
            }
        }
    }

    func tryOptionalUses() {
        let objValidationViewModel = ValidationViewModel()
        // First Way

//        if ( try? objValidationViewModel.validatePassword(password: txtPassword.text!)) == nil {
//            print("Failed")
//        } else {
//            print("Passed")
//        }

        // Second Way
        guard ( try? objValidationViewModel.validatePassword(password: txtPassword.text!)) != nil else {
            print("Failed")
            return
        }
        print("Passed")
    }
    func tryValuesUses() {
        let objValidationViewModel = ValidationViewModel()
        try! objValidationViewModel.validatePassword(password: txtPassword.text!)
        print("woked")
    }
    

}

