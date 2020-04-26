//
//  ImportFromPastGuestsViewController.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 4/25/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation


fileprivate var mockPastGuestsList = ["Dailan", "Holly", "Henry Lee", "Dr. Goldring", "Shiffball", "Dailan", "Angela", "Holly", "Aunt Rachel", "Kevin Fat", "Henry Lee", "Angela", "Holly", "Aunt Rachel", "Kevin Fat", "Henry Lee"]

class ImportFromPastGuestsViewController: UIViewController {
    
    @IBOutlet weak var importFromPastGTable: UITableView!
    
    var postFilteringGuestList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        importFromPastGTable.delegate = self
        importFromPastGTable.dataSource = self
    //    self.customizedTableViewBackground()
        postFilteringGuestList = mockPastGuestsList
 
     }

}
    
    extension ImportFromPastGuestsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cello = importFromPastGTable.dequeueReusableCell(withIdentifier: GlobalConstants.importFromPastGuestsCell, for: indexPath) as! ImportFPastGTviCell
        
        cello.chequeMarsImageView.image = UIImage(named: "chequeMars512pixels.png")?.withRenderingMode(.alwaysOriginal)
        cello.importGNamesCelloLabel.text = mockPastGuestsList[indexPath.row]

        return cello
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postFilteringGuestList.count
    }
    
}

