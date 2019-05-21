//
//  CharacterDetailsSiblingsCell.swift
//  GOTSwift
//
//  Created by ibrahima on 21/05/2019.
//  Copyright © 2019 Ibrahima DANSOKO. All rights reserved.
//

import UIKit

class CharacterDetailsSiblingsCell: UITableViewCell {
    
    @IBOutlet weak var siblingLabel: UILabel!
    
    func configure(withCharacter sibling: String) {
        print(sibling)
        siblingLabel.text = sibling
    }
}
