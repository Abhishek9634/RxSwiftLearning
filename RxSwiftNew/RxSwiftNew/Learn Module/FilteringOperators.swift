//
//  FilterinOperators.swift
//  RxSwiftNew
//
//  Created by Abhishek Thapliyal on 14/10/18.
//  Copyright © 2018 Abhishek Thapliyal. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class FilteringOperators {
    
    static let shared = FilteringOperators()
    
    private init() { }
    
    let disposeBag = DisposeBag()
    
    func run() {
        self.ignore()
        self.elementAt()
        self.filter()
        self.skip()
        self.skipWhile()
        self.skipUntil()
        self.take()
        self.takeWhile()
    }
    
    func ignore() {
        let pSub = PublishSubject<String>()
        let _ = pSub.ignoreElements().subscribe { element in
            print("Ignore: \(element)")
        }.disposed(by: self.disposeBag)
        
        pSub.onNext("x")
        pSub.onNext("y")
        pSub.onNext("z")
        
        pSub.onCompleted()
    }
    
    func elementAt() {
        let pSub = PublishSubject<String>()
        let _ = pSub.elementAt(1).subscribe { element in
            print("ELEMENT AT: \(element)")
        }.disposed(by: self.disposeBag)
        
        pSub.onNext("x")
        pSub.onNext("y")
        pSub.onNext("z")
        
        pSub.onCompleted()
    }
    
    func filter() {
        let obs = Observable.of(1, 2, 3, 4, 5, 6)
        let _ = obs.filter { $0 < 3 }.subscribe { element in
            print("ELEMENT : \(element)")
        }.disposed(by: self.disposeBag)
        
        let obs1 = Observable.of(1, 2, 3, 4, 5, 6)
        let _ = obs1.filter { $0 < 3 }.subscribe(onNext: {
            print("VALUE : \($0)")
        })
    }
    
    func skip() {
        let obs = Observable.of(1, 2, 3, 4, 5, 6)
        let _ = obs.skip(3).subscribe { element in
            print("SKIP : \(element)")
        }.disposed(by: self.disposeBag)
    }
    
    func skipWhile() {
        let obs = Observable.of(2, 3, 4, 5, 6) // IT WILL SKIP ONLY ONCE WHEN CONDITION SATIFIES &
                                               // REST WILL BE SAME, CHEK ON FIRST VALUE ONLY
        let _ = obs.skipWhile { $0 % 2 == 0 }.subscribe { element in
            print("SKIP WHILE : \(element)")
        }.disposed(by: self.disposeBag)
    }
    
    func skipUntil() {
        
        let pSub = PublishSubject<String>()
        let trigger = PublishSubject<String>()
        
        let _ = pSub.skipUntil(trigger).subscribe { element in
            print("SKIP UNTIL : \(element)")
        }.disposed(by: self.disposeBag)
        
        pSub.onNext("x")
        pSub.onNext("y")
        trigger.onNext("TRIGGER")
        pSub.onNext("z")
        pSub.onCompleted()
    }
 
    func take() {
        let obs = Observable.of(1, 2, 3, 4, 5, 6)
        let _ = obs.take(2).subscribe {
            print("TAKE : \($0)")
        }.disposed(by: self.disposeBag) // Opp. of Skip aka take first 2 elements
    }
    
    func takeWhile() {
        let obs = Observable.of(1, 2, 3, 4, 5, 6)
        let _ = obs.takeWhile { $0 < 4 }.subscribe {
            print("TAKE-WHILE : \($0)")
        }.disposed(by: self.disposeBag) // ALSO TAKE WHILE WITH INDEX & TAKE UNTIL
    }
}
