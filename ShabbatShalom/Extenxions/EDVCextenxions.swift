//
//  EDVCextenxions.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 4/12/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

extension EventDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mainSB = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let destination = mainSB.instantiateViewController(withIdentifier: GlobalConstants.guestListVCStoryboardID) as? GuestListViewController else {
            print("destination not lucid")
            return
        }
        
        navigationController?.crossDissolve(destination)
        
    }
}

extension EventDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = eventDetailsTableView.dequeueReusableCell(withIdentifier: "cello", for: indexPath)
        
        cell.textLabel?.textColor = .systemGray
        cell.textLabel?.text = "Who's coming?"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
}
