//
//  YouGenreTableViewCell.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 1/29/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import UIKit

class YouGenreTableViewCell: UITableViewCell {

    //MARK: Properties

    @IBOutlet weak var bubbleImageView: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
