//
//  CharacterDetailsTitlesCell.swift
//  GOTSwift
//
//  Created by ibrahima on 21/05/2019.
//  Copyright © 2019 Ibrahima DANSOKO. All rights reserved.
//

import UIKit

class CharacterDetailsTitlesCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(withCharacter title: String) {
        titleLabel.text = title
    }
}
