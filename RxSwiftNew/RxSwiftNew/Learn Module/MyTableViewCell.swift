//
//  MyTableViewCell.swift
//  RxSwiftNew
//
//  Created by Abhishek Thapliyal on 28/10/18.
//  Copyright © 2018 Abhishek Thapliyal. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var item: String = "" {
        didSet {
            self.myLable.text = self.item
        }
    }
}
