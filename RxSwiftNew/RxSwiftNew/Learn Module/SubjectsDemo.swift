//
//  SubjectsDemo.swift
//  RxSwiftNew
//
//  Created by Abhishek Thapliyal on 21/02/19.
//  Copyright © 2019 Abhishek Thapliyal. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class SubjectsDemo {
    
    static let shared = SubjectsDemo()
    private init() { }
    
    let disaposeBag = DisposeBag()
    
    let publishObj = PublishSubject<String>()
    let behaviourSubject = BehaviorSubject(value: "Start")
    let behaviourSubjectA = BehaviorSubject<[String]>(value: [])
    let varSubject = Variable<String>("Start")
    let behaviourRelay = BehaviorRelay<String>(value: "")
    let behaviourRelayA = BehaviorRelay<[String]>(value: [])
    let replaySubject = ReplaySubject<String>.create(bufferSize: 10)
    
    
    func run() {
        
        self.setupPS()
        self.setupBS()
        self.setupBSA()
        self.setupVS()
        self.setupRS()
        self.setupBR()
        self.setupBRA()
    }
    
    //PUBLISH SUBJECT
        
        func setupPS() {
            
            self.publishObj.onNext("One")
            self.publishObj.onNext("Two")
            
            self.subcribePS()
            self.runPS()
        }
        
        func subcribePS() {
            let subscription = self.publishObj.subscribe(onNext:{
                print("Publish Subject : \($0)")
            }).disposed(by: self.disaposeBag)
            
            // OR
            //        subscription1.disposed(by: self.disaposeBag)
        }
        
        func runPS() {
            self.publishObj.onNext("Three")
            self.publishObj.onNext("Four")
            self.publishObj.on(.next("5"))
        }
        
        /* O/P
         
         Three
         Four
         5
         */
    
    //BEHAVIOUR SUBJECT

        func setupBS() {
            self.behaviourSubject.onNext("Zero")
            self.behaviourSubject.onNext("One")
            self.behaviourSubject.onNext("Two")
    
            self.subcribeBS()
            self.runBS()
        }
    
        func subcribeBS() {
            let subscription = self.behaviourSubject.subscribe(onNext:{
                print("Behaviour Subject: \($0)")
            }).disposed(by: self.disaposeBag)
        }
    
        func runBS() {
            self.behaviourSubject.onNext("Three")
            self.behaviourSubject.onNext("Four")
        }
    
        /* O/P
    
         Two // VALUE JUST BEFORE SUBSCRIBING
         Three
         Four
    
         */

    // BEHAVIOUR SUBJECT: case array
    func setupBSA() {
        
        self.behaviourSubjectA.onNext(["Zero"])
        self.behaviourSubjectA.onNext(["One"])
        self.behaviourSubjectA.onNext(["Two"])
        
        self.subcribeBSA()
        self.runBSA()
    }
    
    func subcribeBSA() {
        let subscription = self.behaviourSubjectA.subscribe(onNext: {
            print("BSA DEMO: \($0)")
        }).disposed(by: self.disaposeBag)
        
        let _ = self.behaviourSubjectA.subscribe(onNext: { (value) in
            print("BSA T: \(value)")
        }, onError: { (error) in
            print("BSA T: \(error)")
        }, onCompleted: {
            print("BSA T COMPLETED")
        }, onDisposed: {
            print("BSA T DISPOSED")
        }).disposed(by: self.disaposeBag)
        
    }
    
    func runBSA() {
        var array = try! self.behaviourSubjectA.value()
        array.append("Three")
        array.append("Four")
        self.behaviourSubjectA.onNext(array)
    }
    
    /*  O/P
     
    
     
     */
    
    
    //VARIABLE SUBJECT
        
        func setupVS() {
            
            self.varSubject.value = "Zero"
            self.varSubject.value = "One"
            self.varSubject.value = "Two"
            
            self.subcribeVS()
            self.runVS()
        }
        
        func subcribeVS() {
            let _ = self.varSubject.asObservable().subscribe(onNext:{
                print("VAR SUBJECT: \($0)")
            }).disposed(by: self.disaposeBag)
        }
        
        func runVS() {
            self.varSubject.value = "Three"
            self.varSubject.value = "Four"
        }
        
        /* O/P
         
         ℹ️ [DEPRECATED] `Variable` is planned for future deprecation. Please consider `BehaviorRelay` as a replacement. Read more at: https://git.io/vNqvx
         Two
         Three
         Four
         
         */
    
    //REPLAY SUBJECT
    
        func setupRS() {
    
            self.replaySubject.onNext("Zero")
            self.replaySubject.onNext("One")
            self.replaySubject.onNext("Two")
    
            self.subcribeRS()
            self.runRS()
        }
    
        func subcribeRS() {
            let subscription = self.replaySubject.subscribe(onNext:{
                print("Replay Subject: \($0)")
            }).disposed(by: self.disaposeBag)
        }
    
        func runRS() {
            self.replaySubject.onNext("Three")
            self.replaySubject.onNext("Four")
        }
    
        /* O/P
    
         Zero
         One
         Two
         Three
         Four
    
         */
    
    // BEHAVIOUR RELAY
    func setupBR() {
        
        self.behaviourRelay.accept("Zero")
        self.behaviourRelay.accept("One")
        self.behaviourRelay.accept("Two")
        
        self.subcribeBR()
        self.runBR()
    }
    
    func subcribeBR() {
        let subscription = self.behaviourRelay.subscribe(onNext:{
            print("BR DEMO: \($0)")
        }).disposed(by: self.disaposeBag)
    }
    
    func runBR() {
        self.behaviourRelay.accept("Three")
        self.behaviourRelay.accept("Four")
    }
    
    /*  O/P
     
     BR DEMO: Two
     BR DEMO: Three
     BR DEMO: Four
     
     */
    
    // BEHAVIOUR RELAY: case array
    func setupBRA() {
        
        self.behaviourRelayA.accept(["Zero"])
        self.behaviourRelayA.accept(["One"])
        self.behaviourRelayA.accept(["Two"])
        
        self.subcribeBRA()
        self.runBRA()
    }
    
    func subcribeBRA() {
        let subscription = self.behaviourRelayA.subscribe(onNext:{
            print("BRA DEMO: \($0)")
        }).disposed(by: self.disaposeBag)
        
        
        let _ = self.behaviourRelayA.subscribe(onNext: { (value) in
            print("BRA T: \(value)")
        }, onError: { (error) in
            print("BRA T: \(error)")
        }, onCompleted: {
             print("BRA T COMPLETED")
        }, onDisposed: {
            print("BRA T DISPOSED")
        }).disposed(by: self.disaposeBag)
        
    }
    
    func runBRA() {
        var array = self.behaviourRelayA.value
        array.append("Three")
        array.append("Four")
        self.behaviourRelayA.accept(array)
    }
    
    /*  O/P
     
     BR DEMO: Two
     BR DEMO: Three
     BR DEMO: Four
     
     */
    
}
