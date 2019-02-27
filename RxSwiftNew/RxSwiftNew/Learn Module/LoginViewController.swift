//
//  LoginViewController.swift
//  RxSwiftNew
//
//  Created by Abhishek Thapliyal on 13/11/18.
//  Copyright © 2018 Abhishek Thapliyal. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    private let disaposeBag = DisposeBag()
    private var username = BehaviorRelay<String>(value: "")
    private var password = BehaviorRelay<String>(value: "")
    
    private var isValid: Observable<Bool> {
        return Observable.combineLatest(self.username,
                                        self.password) { (usernameText, passwordText) in
            print("UN: \(usernameText) && PW: \(passwordText)")
            return !usernameText.isEmpty && passwordText.count > 7
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    private func setup() {
        
        _ = self.userNameField.rx.text.map { $0 ?? "" }.bind(to: self.username)
        _ = self.passwordField.rx.text.map { $0 ?? "" }.bind(to: self.password)
        _ = self.isValid.bind(to: self.loginButton.rx.isEnabled)
        
        _ = self.isValid.subscribe(onNext: { [unowned self] isValid in
            self.errorLabel.text = isValid ? "Validation Success" : "Validation Failed"
        }).disposed(by: self.disaposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
    }
}
