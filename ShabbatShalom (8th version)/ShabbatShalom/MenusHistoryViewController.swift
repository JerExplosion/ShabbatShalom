//
//  MenusHistoryViewController.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 4/23/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class MenusHistoryViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


         self.clearsSelectionOnViewWillAppear = false

         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GlobalConstants.menusHistoryCell, for: indexPath)
        cell.textLabel?.text = "Grape Juice"
        
        return cell
        
    }


    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    let primaryStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
        guard let destinationViewC =
            primaryStoryBoard.instantiateViewController(withIdentifier: GlobalConstants.recipesVCStoryboardID) as? RecipesViewController else {
            print("destination unfound")
            return
        }

        navigationController?.crossDissolve(destinationViewC)

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
