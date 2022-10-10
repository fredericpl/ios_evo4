//
//  expenseCell.swift
//  IOS_EVO4
//
//  Created by Plancquet Frederic on 10/10/2022.
//

import UIKit

class expenseCell: UITableViewCell {

    @IBOutlet weak var amountLb: UILabel!
    @IBOutlet weak var expenseLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
