//
//  TeburuBiewExtenxions.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 4/5/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit



extension EventsViewController {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            eventNameEntered = "deleted"
            
            eventsContainerArray.remove(at: indexPath.row)
            
            eventsTable.reloadData()
        }
    }
}

// if editingStyle == .Delete {
// Delete the row from the data source
// myData.removeAtIndex(indexPath.row)
// tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
 
extension EventDetailsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
      //  return
    }
}
