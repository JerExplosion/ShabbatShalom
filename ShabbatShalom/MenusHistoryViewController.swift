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

    // MARK: - Table view daga dele-source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GlobalConstants.menusHistoryCell, for: indexPath)
        cell.textLabel?.text = "Grape Juice"
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
}
