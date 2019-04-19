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
        Source.fetchSource { (result) in
            switch result {
            case .success:
                break
            case .failure(let error):
                break
            }
        }
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        
    }

}
