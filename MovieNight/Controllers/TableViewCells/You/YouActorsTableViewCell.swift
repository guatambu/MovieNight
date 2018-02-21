//
//  YouActorsTableViewCell.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 1/29/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import UIKit

class YouActorsTableViewCell: UITableViewCell {

    //MARK: Properrties
    
    @IBOutlet weak var youActorsTableCellContentView: UIView!
    @IBOutlet weak var bubbleSelectedTableCellContentView: UIImageView!
    @IBOutlet weak var personProfilePictureImageView: UIImageView!
    @IBOutlet weak var actorFullNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure (with viewModel: YouPeopleViewModel) {
        actorFullNameLabel.text = viewModel.fullName
    }

}


