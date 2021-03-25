//
//  PersonViewCell.swift
//  it3VideoCallSample
//
//  Created by Hieu Tran on 10/6/20.
//

import UIKit

class PersonViewCell: UITableViewCell {

    @IBOutlet weak var vAva: UIView!
    @IBOutlet weak var lblAva: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblRelationship: UILabel!
    @IBOutlet weak var btnVideoCall: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.vAva.backgroundColor = .orange
        self.vAva.layer.cornerRadius = self.vAva.frame.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
