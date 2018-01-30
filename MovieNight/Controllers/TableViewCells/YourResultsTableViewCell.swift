//
//  YouTableViewCell.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 1/26/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import UIKit

class YourResultsTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var briefMovieDescriptionLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
