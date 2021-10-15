//
//  ListTableViewCell.swift
//  SearchMovie
//
//  Created by yeoboya on 2021/10/15.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var endgame: UILabel!
    @IBOutlet weak var subtitles: UILabel!
    @IBOutlet weak var star: UILabel!
    @IBOutlet weak var directors: UILabel!
    @IBOutlet weak var actors: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
