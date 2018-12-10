//
//  SupportViewController.swift
//  RSSReader
//
//  Created by Jenny Rykun on 12/6/18.
//  Copyright © 2018 Jenny Rykun. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsTable: UITableView!
    
    
    @IBAction func addServer(_ sender: Any) {
    
    }
    
    fileprivate var servers: [Server] = []
    
    let model: SettingsModelProtocol = SettingsModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateServers()
    }

    private func updateServers() {
        servers = model.fetchServers()
        settingsTable.reloadData()
    }
    

}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = servers[indexPath.row].name
        cell.detailTextLabel?.text = servers[indexPath.row].address?.absoluteString
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servers.count
    }
    
    func tableView(_ tableView: UITableView, numbersOfSections: Int) -> Int {
          return 1
    }

}
