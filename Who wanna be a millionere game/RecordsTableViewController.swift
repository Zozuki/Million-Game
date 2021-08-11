//
//  RecordsTableViewController.swift
//  Who wanna be a millionere game
//
//  Created by user on 11.08.2021.
//

import UIKit

class RecordsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Game.shared.records.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecordsTBCell") else { return UITableViewCell() }
        
        cell.textLabel?.text = "\(Game.shared.records[indexPath.row].value)"
        cell.detailTextLabel?.text = "\(Game.shared.records[indexPath.row].date)"
        
        return cell
    }
    
}
