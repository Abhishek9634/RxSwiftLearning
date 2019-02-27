//
//  ViewController.swift
//  RxSwiftNew
//
//  Created by Abhishek Thapliyal on 07/09/18.
//  Copyright © 2018 Abhishek Thapliyal. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // OBSERVABLES
//        ObservableDemo.shared.run()
        
        // SUBJECTS
//        SubjectsDemo.shared.run()
        
        // FILTERING OPERATORS
//        FilteringOperators.shared.run()
        
        // TRANSFORMING OPERATORS
        TransformingOperators.shared.run()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // OBSERVABLES
    
    let observable = Observable<String>.create { (observer) -> Disposable in
        observer.onNext("Hello dummy 🐣 1")
        observer.onNext("Hello dummy 🐣 2")
        observer.onNext("Hello dummy 🐣 3")
        observer.onCompleted()
        return Disposables.create()
    }
}


