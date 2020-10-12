//
//  MasterViewController.swift
//  MultipleScreenSupportApp
//
//  Created by Developer Admin on 08/07/20.
//  Copyright © 2020 Developer Admin. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    let monsters = [
      Monster(name: "Bar Charts", description: "MEE-OW",
              iconName: "meetcatbot", weapon: .sword),
      Monster(name: "Pie Charts", description: "BOW-WOW",
              iconName: "meetdogbot", weapon: .blowgun),
      Monster(name: "Line Charts", description: "BOOM!",
              iconName: "meetexplodebot", weapon: .smoke),
      Monster(name: "Labelled Pie Chart", description: "BOOM!",
      iconName: "meetexplodebot", weapon: .smoke),
      Monster(name: "Pie Chart2", description: "BOOM!",
      iconName: "meetexplodebot", weapon: .smoke),
      Monster(name: "Combined Charts", description: "BOOM!",
      iconName: "meetexplodebot", weapon: .smoke),
      
    ]
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return monsters.count
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return monsters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let monster = monsters[indexPath.row]
        cell.textLabel?.text = monster.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let selectedMonster = monsters[indexPath.row]
        if (indexPath.row == 0) {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "BarChartViewController") as? BarChartViewController {
                splitViewController?.showDetailViewController(vc, sender: nil)
            }
        } else if (indexPath.row == 1) {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DtailVC") as? DetailViewController {
                vc.monster = selectedMonster
                splitViewController?.showDetailViewController(vc, sender: nil)
            }
        } else if (indexPath.row == 2) {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "LineChartViewController") as? LineChartViewController {
                //vc.monster = selectedMonster
                splitViewController?.showDetailViewController(vc, sender: nil)
            }
        } else if (indexPath.row == 3) {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "LabelledPieChartViewController") as? LabelledPieChartViewController {
                splitViewController?.showDetailViewController(vc, sender: nil)
            }
        } else if (indexPath.row == 4) {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "PieChartSecondViewController") as? PieChartSecondViewController {
                splitViewController?.showDetailViewController(vc, sender: nil)
            }
        } else if (indexPath.row == 5) {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "CombinedChartViewController") as? CombinedChartViewController {
                //vc.monster = selectedMonster
                splitViewController?.showDetailViewController(vc, sender: nil)
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
