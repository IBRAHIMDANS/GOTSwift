//
//  CharacterDetailsCell.swift
//  GOTSwift
//
//  Created by ibrahima on 21/05/2019.
//  Copyright © 2019 Ibrahima DANSOKO. All rights reserved.
//

import UIKit

class CharacterDetailsCell: UITableViewCell {
    
    @IBOutlet weak var actorImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    
    func configure(name: String, actor: String, image: String) {
        nameLabel.text = name
        actorLabel.text = actor
        actorImageView.sd_setImage(with: URL(string: image), completed: nil)
    }
}
