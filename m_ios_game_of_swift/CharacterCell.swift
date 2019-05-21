//
//  CharacterCell.swift
//  GOTSwift
//
//  Created by ibrahima on 21/05/2019.
//  Copyright © 2019 Ibrahima DANSOKO. All rights reserved.
//
import UIKit

class CharacterCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var actorLabel: UILabel!
    
    func configure(withCharacter character: Character) {
        nameLabel.text = character.name
        actorLabel.text = character.actor
    }
}
