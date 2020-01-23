//
//  CollectionViewCell.swift
//  SmartLab
//
//  Created by maika on 12/3/19.
//  Copyright © 2019 maika. All rights reserved.
//

import UIKit
import SDWebImage

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var testCount: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imgCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCell(event:Event2){
        price.text = String(event.price)
        testCount.text = String(event.testCount)
        titleLbl.text = event.title
        imgCell.sd_setImage(with: URL(string: event.img), placeholderImage: UIImage(named: "placeholder.png"))
    }
}
