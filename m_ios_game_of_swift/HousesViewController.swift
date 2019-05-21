//
//  HousesViewController.swift
//  GOTSwift
//
//  Created by ibrahima on 21/05/2019.
//  Copyright © 2019 Ibrahima DANSOKO. All rights reserved.
//

import UIKit
import Alamofire

class HousesViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var houses:[House] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        requestHouses()
        print(houses)
        
//        let data = Data()
//        let decoder = JSONDecoder()
//
//        let houses: [House] = (try? decoder.decode([House].self, from: data)) ?? []
        // Do any additional setup after loading the view.
    }
    
    func requestHouses() {
        APIHandler.requestHouses(success: {(data) in
            let decoder = JSONDecoder()
            self.houses = (try? decoder.decode([House].self, from: data)) ?? []
            self.tableView.reloadData()
            print(self.houses)
        }) { (error) in
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HouseCell", for: indexPath) as? HouseCell {
            cell.configure(withHouse: houses[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
//    private func fetchHouses() {
//        RequestManager.requestHouses(success: { data in
//            let decoder = JSONDecoder()
//            self.houses = try? decoder.decode(House.self, from: data)
//            self.tableView.reloadData()
//        }) { error in
//            print(error)
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (segue.identifier == "CharactersSegue") {
            if let charactersVC =  segue.destination as? CharactersViewController, let indexPathSelected = tableView.indexPathForSelectedRow {
                charactersVC.houseName = houses[indexPathSelected.row].name
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
