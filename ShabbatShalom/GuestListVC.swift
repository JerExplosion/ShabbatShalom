//
//  GuestListVC.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 4/3/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit


var mockGuestList = ["Dr. Goldring", "Shiffball", "Dailan", "Angela", "Holly", "Aunt Rachel", "Kevin Fat", "Henry Lee"]

class GuestListViewController: UIViewController {
    @IBOutlet weak var guestTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guestTable.layer.cornerRadius = 26
        guestTable.dataSource = self
        guestTable.delegate = self
             
        let backgroundImageView = UIImageView(image: UIImage(named: "blurGradient.png"))
        backgroundImageView.contentMode = .scaleAspectFit
        // default is .scaleToFill

        guestTable.backgroundView = backgroundImageView

        let blurring = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurredView = UIVisualEffectView(effect: blurring)
        blurredView.frame = backgroundImageView.bounds
        backgroundImageView.addSubview(blurredView)


    }
    
    @IBAction func modernNewGuestButton(_ sender: UIButton) {
        
        var localTextfield = UITextField()
        
        let alertCon = UIAlertController(title: "Who's invited?", message: "", preferredStyle: .alert)
        
        alertCon.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "E.g Mulan"          
            localTextfield = alertTextfield
        }
        
        let createAction = UIAlertAction(title: "Confirm", style: .default) { (action) in
            mockGuestList.append(localTextfield.text!)
            self.guestTable.reloadData()
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let importAction = UIAlertAction(title: "Import from past guests", style: .default) { (someSortaAction) in
        
            self.performSegue(withIdentifier: "importFrom", sender: self)
        }     

        alertCon.addAction(cancelAction)
        alertCon.addAction(createAction)
        alertCon.addAction(importAction)
         
        present(alertCon, animated: true, completion: nil)

    }


}


extension GuestListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = guestTable.dequeueReusableCell(withIdentifier: GlobalConstants.cellIdentity, for: indexPath)
        as! GuestListTViCell
        
        cell.guestNameTviCelloLabel.text = mockGuestList[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockGuestList.count
    }

}

extension GuestListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guestTable.deselectRow(at: indexPath, animated: true)
        
        let targetVC = storyboard?.instantiateViewController(withIdentifier: GlobalConstants.guestDetailsVCStoryboardID) as! GuestDetailsViewController
        
        GlobalConstants.guestDetailsNavigationBarTitle = mockGuestList[indexPath.row]
        
        navigationController?.pushViewController(targetVC, animated: true)
        
    }
}

extension GuestListViewController {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
        mockGuestList.remove(at: indexPath.row)
        
            guestTable.deleteRows(at: [indexPath], with: .none)
            
    //    guestTable.reloadData()
    }
    
    }
}




    
