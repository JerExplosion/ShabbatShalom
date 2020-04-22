//
//  GuestsHistoryViewController.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 4/20/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation


fileprivate var mockGuestsHistoryList = ["Dailan", "Holly", "Henry Lee", "Dr. Goldring", "Shiffball", "Dailan", "Angela", "Holly", "Aunt Rachel", "Kevin Fat", "Henry Lee", "Angela", "Holly", "Aunt Rachel", "Kevin Fat", "Henry Lee"]


class GuestsHistoryViewController: UITableViewController, UISearchResultsUpdating {
    
    var filteredGuestList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredGuestList = mockGuestsHistoryList
        
        DispatchQueue.main.async {
            self.tableAnimated()
            self.customizedTableViewBackground()
        }

        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "hunting down a guest"
        search.searchResultsUpdater = self
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchCriteria = searchController.searchBar.text,searchCriteria.count > 0 {
            
            filteredGuestList = mockGuestsHistoryList.filter {
                $0.contains(searchCriteria)
            }
        } else {
            filteredGuestList = mockGuestsHistoryList
        }
        tableView.reloadData()
        print("updateSearchResults called")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGuestList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cello = tableView.dequeueReusableCell(withIdentifier: GlobalConstants.guestsHistoryCell, for: indexPath)
        
        cello.textLabel?.text = filteredGuestList[indexPath.row]
        cello.detailTextLabel?.text = ""
        
        return cello
        
    }
}

extension GuestsHistoryViewController {
    
    func customizedTableViewBackground() {
        let backgroundImageView = UIImageView(image: UIImage(named: "blurGradient.png"))
        backgroundImageView.contentMode = .scaleAspectFit
        tableView.backgroundView = backgroundImageView
        let blurring = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurredView = UIVisualEffectView(effect: blurring)
        blurredView.frame = backgroundImageView.bounds
        backgroundImageView.addSubview(blurredView)

    }
}
