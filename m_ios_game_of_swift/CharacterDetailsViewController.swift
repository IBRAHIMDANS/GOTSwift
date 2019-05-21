//
//  CharacterDetailsViewController.swift
//  GOTSwift
//
//  Created by ibrahima on 21/05/2019.
//  Copyright © 2019 Ibrahima DANSOKO. All rights reserved.
//
import UIKit

class CharacterDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
//    var name: String = ""
//    var actor: String = ""
//    var image: String = ""
//    var titles: [String] = []
//    var siblings: [String] = []
    var character: Character? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
//        print(name)
//        print(actor)
//        print(image)
//        print(titles)
//        print(siblings)
//        print(character?.siblings ?? <#default value#>)
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
            case 0:
                return 1
            case 1:
                return character?.titles.count ?? 1
            case 2:
                return character?.siblings.count ?? 1
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell") as! UITableViewCell
        switch (indexPath.section) {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterDetailCell", for: indexPath) as? CharacterDetailsCell {
                cell.configure(name: character?.name ?? "", actor: character?.actor ?? "", image: character?.image ?? "")
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTitlesDetailCell", for: indexPath) as? CharacterDetailsTitlesCell {
                cell.configure(withCharacter: character?.titles[indexPath.row] ?? "")
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterSiblingsDetailCell", for: indexPath) as? CharacterDetailsSiblingsCell {
                cell.configure(withCharacter: character?.siblings[indexPath.row] ?? "")
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 1:
            return "Titles"
        case 2:
            return "Siblings"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
