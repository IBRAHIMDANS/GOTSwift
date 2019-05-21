//
//  CharactersViewController.swift
//  GOTSwift
//
//  Created by ibrahima on 21/05/2019.
//  Copyright © 2019 Ibrahima DANSOKO. All rights reserved.
//
import UIKit

class CharactersViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var houseName: String?
    var characters: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        requestCharacters()
        // Do any additional setup after loading the view.
    }
    
    func requestCharacters() {
        APIHandler.requestCharacterByHouse(houseName: houseName ?? "", success: { (data) in
            let decoder = JSONDecoder()
            self.characters = (try? decoder.decode([Character].self, from: data)) ?? []
            self.tableView.reloadData()
        }) { (error) in
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as? CharacterCell {
            cell.configure(withCharacter: characters[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "CharacterDetailsSegue") {
            if let characterDetailsVC =  segue.destination as? CharacterDetailsViewController, let indexPathSelected = tableView.indexPathForSelectedRow {
//                characterDetailsVC.name = characters[indexPathSelected.row].name
//                characterDetailsVC.actor = characters[indexPathSelected.row].actor
//                characterDetailsVC.image = characters[indexPathSelected.row].image
//                characterDetailsVC.titles = characters[indexPathSelected.row].titles
//                characterDetailsVC.siblings = characters[indexPathSelected.row].siblings
                characterDetailsVC.character = characters[indexPathSelected.row]
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
