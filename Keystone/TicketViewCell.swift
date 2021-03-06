//
//  TicketViewCell.swift
//  Keystone
//
//  Created by Adit Dhruv on 2018-04-20.
//  Copyright © 2018 Softchoice. All rights reserved.
//

import UIKit

class TicketViewCell: UITableViewCell {
    @IBOutlet weak var ticket_id: UILabel!
    
    @IBOutlet weak var ticket_description: UILabel!
    @IBOutlet weak var ticket_date: UILabel!
    @IBOutlet weak var ticket_priority: UILabel!
    @IBOutlet weak var ticket_status: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var status_btn: UIImageView!
    
    @IBOutlet weak var priority_btn: UIImageView!
    @IBOutlet weak var date_btn: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

}
