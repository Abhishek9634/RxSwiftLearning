//
//  SourceTableViewCell.swift
//  RxSwiftNew
//
//  Created by Abhishek Thapliyal on 19/04/19.
//  Copyright © 2019 Abhishek Thapliyal. All rights reserved.
//

import UIKit
import Model

struct SourceCellModel {
    var source: Source
}

class SourceTableViewCell: TableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func configure(_ item: Any?) {
        guard let model = item as? SourceCellModel else { return }
        self.nameLabel.text = model.source.name
    }
    
}
