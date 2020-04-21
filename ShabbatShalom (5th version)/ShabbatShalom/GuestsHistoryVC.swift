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

class GuestsHistoryViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockGuestsHistoryList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cello = tableView.dequeueReusableCell(withIdentifier: GlobalConstants.guestsHistoryCell, for: indexPath)
        
        cello.textLabel?.text = mockGuestsHistoryList[indexPath.row]
        
        cello.detailTextLabel?.text = "\(indexPath.row)"
        
        return cello
        
    }
    
    
    
}
