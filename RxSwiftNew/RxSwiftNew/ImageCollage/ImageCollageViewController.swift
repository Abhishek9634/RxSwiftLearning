//
//  ImageCollageViewController.swift
//  RxSwiftNew
//
//  Created by Abhishek Thapliyal on 27/02/19.
//  Copyright © 2019 Abhishek Thapliyal. All rights reserved.
//

import UIKit
import Model
import RxCocoa
import RxSwift

class ImageCollageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clearAction(_ sender: UIButton) {
        self.showLoader()
        Source.fetchSource { (result) in
            self.hideLoader()
            switch result {
            case .success(let response):
                print(response.list)
            case .failure(let error):
                self.handle(error: error)
            }
        }
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        
    }

}
