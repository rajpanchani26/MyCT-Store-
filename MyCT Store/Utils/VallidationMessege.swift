//
//  VallidationMessege.swift
//  MyCT Store
//
//  Created by R86 on 28/03/23.
//

import Foundation


struct LogiungValidation{
    static let userNameEmpty = "Please Enter UserName"
    static let userNameInvalid = "Please Enter Valide UserName"
    static let paswsordEmpty = "Please Enter Passwoprd"
    static let paswsordInvalid = "Please Enter Valide Passwoprd"
    static let passwordAndConfirgPasswordDoNotMatch = "Password & Confirg Password Shoud be same"
}

struct SignUpValidation {
    static let allRequierdValidations = "Please enter all requierd validations"
    static let emptyEmail = "Please enter your emial"
    static let emptyPassword = "Please enter your password"
    static let emptyUserName = "Please enter username"
    static let emptyDateOfBirth = "Please enter date of birth"
    static let shortPassword = "Password is too short"
    static let invalidUserName = "User name is not valid"
}

struct PasswordValidation {
    static let emptyTextField = "Enter your password and confirm password"
    static let emptyPassword = "Please enter your password"
    static let emptyConfirmPassword = "Please confirm your password"
    static let passwordIsNotSame = "Your confirm password is wrong"
    static let shortPassword = "Password is invalid"
}
