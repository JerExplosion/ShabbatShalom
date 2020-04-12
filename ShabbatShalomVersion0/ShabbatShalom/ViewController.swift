//
//  ViewController.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 4/3/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit


var mockGuestList = ["Dr. Goldring", "Shiffball", "Dailan", "Angela", "Holly", "Aunt Rachel", "Kevin Fat", "Henry Lee"]

class ViewController: UIViewController {
    @IBOutlet weak var guestTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guestTable.dataSource = self
        guestTable.delegate = self
        
    }


}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = guestTable.dequeueReusableCell(withIdentifier: GlobalConstants.cellIdentity, for: indexPath)
        
        cell.textLabel?.text = mockGuestList[indexPath.row]
        print(mockGuestList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockGuestList.count
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guestTable.deselectRow(at: indexPath, animated: true)
        
        let targetVC = storyboard?.instantiateViewController(withIdentifier: GlobalConstants.subsequentVCIdentity) as! SubsequentViewController
        
        GlobalConstants.subsequentNavigationBarTitle = mockGuestList[indexPath.row]
        
        navigationController?.pushViewController(targetVC, animated: true)
        
    }
     
     
}




    
