//
//  EventTableViewCell.swift
//  SmartLab
//
//  Created by maika on 12/2/19.
//  Copyright © 2019 maika. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var precautionLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setEvent(event: Event) {
        precautionLbl.text = event.precautions
        titleLbl.text = event.title
        priceLbl.text = String(event.price)
    }

}
