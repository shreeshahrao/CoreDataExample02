//
//  ToDoTableViewCell.swift
//  CoreDataExample02
//
//  Created by Shreesha on 23/11/21.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
     
    @IBOutlet weak var toDoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
