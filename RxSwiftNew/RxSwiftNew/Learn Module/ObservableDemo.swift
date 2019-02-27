//
//  ObservableDemo.swift
//  RxSwiftNew
//
//  Created by Abhishek Thapliyal on 02/10/18.
//  Copyright © 2018 Abhishek Thapliyal. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ObservableDemo {
    
    static let shared = ObservableDemo()
    
    private init() { }
    
    let disposeBag = DisposeBag()
    
    func run() {
        
        // JUST
        self.exJUST()
        
        // OF
        self.exOF()
        
        // FROM
        self.exFROM()
    }
    
    func exJUST() {
        let observeable = Observable<Int>.just(1)
        
        let _ = observeable.subscribe { event in
            print(event)
        }.disposed(by: self.disposeBag)
    }
    
    func exOF() {
        
        print("===== OF =====")
        
//     OR//   let obervable0 = Observable<Int>.of(1, 2, 3)
        let obervable1 = Observable.of(1, 2, 3)
        let obervable2 = Observable.of([1, 2, 3])
//     OR//   let obervable3 = Observable<[Int]>.of([1, 2, 3])
        
        let _ = obervable1.subscribe { event in
            print(event)
        }.disposed(by: self.disposeBag)
        
        let _ = obervable2.subscribe { event in
            print(event)
            if let array = event.element {
                array.forEach {
                    print($0)
                }
            }
        }.disposed(by: self.disposeBag)
        
        // IT EMITS EVENTS: next completed error
        print("=====")
        let _ = obervable1.subscribe(onNext: { element in
            print(element)
        }).disposed(by: self.disposeBag)
    }
    
    func exFROM() {
        
        print("===== FROM ===== IT TAKES ARRAY ONLY")
        
        let obervable2 = Observable.from([1, 2, 3])
        let _ = obervable2.subscribe(onNext: { element in
            print(element)
        }).disposed(by: self.disposeBag)
    }
    
}
