//
//  FlagsTableViewController.swift
//  undeflags
//
//  Created by Léna PANCHER on 09/11/2022.
//

import UIKit

class FlagsTableViewController: UITableViewController {
    
    var listFlags = DataManager.shared.flags
    var svgFlags = DataManager.shared.svgLinks

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listFlags!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = self.listFlags![indexPath.row].name

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailFlag") as? DetailFlagViewController {

            vc.name = self.listFlags![indexPath.row].name
            vc.year = self.listFlags![indexPath.row].year
            vc.linkBrowser = self.svgFlags![indexPath.row]

            //Afficher une modal
            self.present(vc, animated: true, completion: nil)

        }
    }
}
