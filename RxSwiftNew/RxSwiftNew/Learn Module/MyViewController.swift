//
//  MyViewController.swift
//  RxSwiftNew
//
//  Created by Abhishek Thapliyal on 28/10/18.
//  Copyright © 2018 Abhishek Thapliyal. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MyViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cellItems = Observable.of([
        "Lisbon", "Copenhagen",
        "London", "Madrid",
        "Vienna"
    ])
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MyViewController: UITableViewDelegate {
    
    func setupTableView() {
        self.cellItems.bind(to: self.tableView.rx.items) { (tableView: UITableView, index: Int, element: String) in
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "MyTableViewCell"
            ) as! MyTableViewCell
            cell.item = element
            return cell
        }.disposed(by: self.disposeBag)
        
        self.tableView.rx.modelSelected(String.self).subscribe(onNext: {
            print("Selected : \($0)")
        }).disposed(by: self.disposeBag)
    }
}
