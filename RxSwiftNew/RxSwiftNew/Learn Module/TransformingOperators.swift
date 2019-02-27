//
//  TransformingOperators.swift
//  RxSwiftNew
//
//  Created by Abhishek Thapliyal on 27/10/18.
//  Copyright © 2018 Abhishek Thapliyal. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TransformingOperators {
    
    static let shared = TransformingOperators()
    
    private init() { }
    
    let disposeBag = DisposeBag()
    
    func run() {
        self.toArray()
        self.mapWithIndex()
        self.startWith()
        self.concat()
        self.merge()
    }
    
    func toArray() {
        _ = Observable.of(1, 2, 3).toArray().subscribe(onNext: {
            print($0)
        }).disposed(by: self.disposeBag)
    }
    
    func mapWithIndex() {
        // DEPECRATED
//        _ = Observable.of(1, 2, 3, 4).mapWithIndex({ (integer, index) in
//            index > 2 ? integer * 2 : integer
//        }).subscribe(onNext: {
//            print($0)
//        }).disposed(by: self.disposeBag)
        
        print("\n ==== MAP WITH INDEX ==== \n")
        
        _ = Observable.of(1, 2, 3, 4).enumerated().map({ (index, integer) in
            index > 2 ? integer * 2 : integer
        }).subscribe(onNext: {
            print($0)
        }).disposed(by: self.disposeBag)
    }
    
    // COMBINIG OPERATORS
    
    func startWith() {
        print("\n ==== START WITH ==== \n")
        var obs = Observable.of(3, 4, 1, 42, 708, 323)
        obs = obs.startWith(101)
        _ = obs.subscribe(onNext: {
            print($0)
        }).disposed(by: self.disposeBag)
    }
    
    func concat() {
        print("\n ==== CONCAT  ==== \n")
        let obs1 = Observable.of(3, 4, 1, 43)
        let obs2 = Observable.of(70, 8, 32)
        let obs = Observable.concat([obs1, obs2])
        _ = obs.subscribe(onNext: {
            print($0)
        }).disposed(by: self.disposeBag)
        // OR
        print("\n ==== CONCAT OR ==== \n")
        let obsC = obs1.concat(obs2)
        _ = obsC.subscribe(onNext: {
            print($0)
        }).disposed(by: self.disposeBag)
    }
    
    func merge() {
        print("\n ==== MERGE ==== \n")
        let obs1 = Observable.of(3, 4, 1, 43)
        let obs2 = Observable.of(70, 8, 32)
        _ = Observable.of(obs1, obs2).merge().subscribe(onNext: {
            print("Merge: \($0)")
        }).disposed(by: self.disposeBag)
    }
}
