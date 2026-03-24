//
//  EmplyeeTVCell.swift
//  EmployeeCoreData
//
//  Created by Tithi Shah on 3/24/26.
//

import UIKit

class EmplyeeTVCell: UITableViewCell {
    
@IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var dojLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
