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

    @IBOutlet weak var tableView: UITableView!
    
    private let disaposeBag = DisposeBag()
    private var sources = BehaviorSubject<[SourceCellModel]>(value: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setupModels()
        self.fetchSource()
    }

}

extension ImageCollageViewController {
    
    private func setupModels() {
        _ = self.sources.subscribe(onNext: { (sources) in
            self.tableView.reloadData()
        }).disposed(by: self.disaposeBag)
    }
    
    private func fetchSource() {
        self.showLoader()
        Source.fetchSource { (result) in
            self.hideLoader()
            switch result {
            case .success(let response):
                let value = response.list.map {
                    SourceCellModel(source: $0)
                }
                self.sources.onNext(value)
            case .failure(let error):
                self.handle(error: error)
            }
        }
    }
    
}

extension ImageCollageViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 84
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return try! self.sources.value().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: SourceTableViewCell.defaultReuseIdentifier
        ) as! SourceTableViewCell
        cell.item = try! self.sources.value()[indexPath.row]
        return cell
    }
    
}
