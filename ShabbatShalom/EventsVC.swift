//
//  EventsViewController.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 4/5/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import CoreData

var eventsContainerArray = ["HBOMax Dash", "Symphony Qi", "EDM Craze", "Dato Knighto", "SupaMart Riot", "Baller Confe"]
  
class EventsViewController: UIViewController {
    
    @IBOutlet weak var threeCheeseBarButton: UIBarButtonItem!
    
    @IBOutlet weak var visualEffectBlurView: UIVisualEffectView!
    
    @IBOutlet weak var sideMenuView: UIView!
    
    @IBOutlet weak var leadingViewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var eventsTable: UITableView!
    
    var sideMenuInSight = false
    
    
    // MARK: - separator
    
    let newFeastoInstance = Feasto(context: universalContext)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coreDataCreate() // so frustrating
        
        print(newFeastoInstance.menu)
        
        // MARK: - Separator
        
        
        
        sideMenuVistaImplementation()
        
        leadingViewConstraint.constant = -247
        
        eventsTable.dataSource = self
        eventsTable.delegate = self
        eventsTable.layer.cornerRadius = 11
        
     //   threeCheeseBarButton.image = UIImage(named: "24pixelsPlainBurger.png")?.withRenderingMode(.alwaysOriginal)
        
    }
    
    func sideMenuVistaImplementation() {
        
        visualEffectBlurView.layer.cornerRadius = 13
        visualEffectBlurView.clipsToBounds = true //easy to forget
        sideMenuView.layer.shadowColor = UIColor.black.cgColor
        sideMenuView.layer.shadowOpacity = 0.77
        sideMenuView.layer.shadowOffset = CGSize(width: 5, height: 0)

    }
    
    @IBAction func sideMenuMovementAction(_ sender: UIBarButtonItem) {
        
        if sideMenuInSight == false {
            leadingViewConstraint.constant = 0
            
            UIView.animate(withDuration: 0.13, animations: {
                self.view.layoutIfNeeded()
            })
  
        } else {
            leadingViewConstraint.constant = -247
            
            UIView.animate(withDuration: 0.55, animations: {
                self.view.layoutIfNeeded()
            })
        }
        sideMenuInSight = !sideMenuInSight
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
  //      eventsTable.reloadData()
        print("viewDidAppear called")
    }
    
    func updatingTable() {
        DispatchQueue.main.async {
            self.eventsTable.reloadData()
        }
    }
    
    // MARK: - Alert Controller Pop-Up
    
    
    
    @IBAction func modernAddButtonTapped(_ sender: UIButton) {
        
        var localTextfield = UITextField()
        
        let alertCon = UIAlertController(title: "What are you hosting?", message: "", preferredStyle: .alert)
        
        alertCon.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "E.g Pre-prom party"
            localTextfield = alertTextfield
        }
        
        // MARK: - new coredata stuff

        

        let createAction = UIAlertAction(title: "Create", style: .default) { (action) in
            eventsContainerArray.append(localTextfield.text!)
            
            
            // MARK: - new coredata stuff
            
            self.newFeastoInstance.title = localTextfield.text!
            self.newFeastoInstance.menu = "menuuu"
            self.newFeastoInstance.notes = "notooo"
            universalFeastoArray.append(self.newFeastoInstance)
            
            do {
                try universalContext.save()
            } catch {
                print("can't save context.  do you copy ")
            }
 
            print(self.newFeastoInstance)
            print(universalFeastoArray)
            
            // MARK: - separator
            
            self.eventsTable.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
         // Respond to user selection of the action.
        }

        alertCon.addAction(cancelAction)
        alertCon.addAction(createAction)
        present(alertCon, animated: true, completion: nil)
        
        
        // coreDataSave() // update the feastoArray first

    }

    @IBAction func guestHistoryButtonClicked(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "guestsHistoryButtonClicked", sender: self)
        leadingViewConstraint.constant = -247
        
    }
    
    @IBAction func menusHistoryButtonClicked(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "menusHistoryButtonClicked", sender: self)
        leadingViewConstraint.constant = -247
    
    }
     
    
    // MARK: - Editing tableView
    
    @IBAction func editingEventsTableBarButton(_ sender: UIBarButtonItem) {
        
        self.eventsTable.isEditing = !self.eventsTable.isEditing
        sender.title = (self.eventsTable.isEditing) ? "Done" : "Edit"
        
    }
}

extension EventsViewController {
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let objectToBeMoved = eventsContainerArray[sourceIndexPath.item]
        eventsContainerArray.remove(at: sourceIndexPath.item)
        eventsContainerArray.insert(objectToBeMoved, at: destinationIndexPath.item)
        
    }
}

// MARK: - TableView DataSource

extension EventsViewController: UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventsTable.dequeueReusableCell(withIdentifier: GlobalConstants.eventsCell, for: indexPath) as! EventsTViCell
        
        switch indexPath.row % 2 {
        case 1:
            cell.backgroundColor = UIColor(red: 253/255, green: 218/255, blue: 250/255, alpha: 1)
        case 0:
            cell.backgroundColor = UIColor(red: 216/255, green: 232/255, blue: 255/255, alpha: 1)
        default:
            cell.backgroundColor = .black
        }
        
    // Tsugi apply the generateColorWithRGB() extension I wrote in Connecto
        
        cell.evTViCelloLabel.text = eventsContainerArray[indexPath.row]

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsContainerArray.count
    }
}

extension EventsViewController: UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        eventsTable.deselectRow(at: indexPath, animated: true)
        
        let primaryStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let destination = primaryStoryBoard.instantiateViewController(withIdentifier: GlobalConstants.eventDetailVCStoryboardID) as? EventDetailsViewController else {
            print("destination unclear bud")
            return
        }
        GlobalConstants.eViDetailsNavigationBarTitle = eventsContainerArray[indexPath.row]
        
        navigationController?.pushViewController(destination, animated: true)         
    }
    
    
    // make sure to check if isUserInteractionEnabled is checked or not
}



// MARK: - some useful didSelectRowAt codes:

//if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//    tableView.cellForRow(at: indexPath)?.accessoryType = .none
//} else {
//    tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//}

// MARK: - UIAlertController/AlertAction

//@IBAction func cornerBarButtonTapped(_ sender: UIBarButtonItem) {
//
//    var localTextfield = UITextField()
//
//    let alertCon = UIAlertController(title: "What is your event?", message: "", preferredStyle: .alert)
//
//    alertCon.addTextField { (alertTextfield) in
//        alertTextfield.placeholder = "E.g Pre-prom party"
//        localTextfield = alertTextfield // not .text?
//    }
//
//    let alertAction = UIAlertAction(title: "Execute", style: .default) { (action) in
//        eventsContainerArray.append(localTextfield.text!)
//        self.eventsTable.reloadData()
//    }
//    alertCon.addAction(alertAction)
//    present(alertCon, animated: true, completion: nil)
//}

// MARK: - Some potential special effects

//eventsTable.layer.masksToBounds = true
//eventsTable.layer.cornerRadius = 11
//
//eventsTable.layer.shadowColor = UIColor.black.cgColor
//eventsTable.layer.shadowOpacity = 0.77
//eventsTable.layer.shadowOffset = CGSize(width: 5, height: 0)

//            self.sideMenuView.slidingInFromWherever(duration: 0.33, whichDirection: .fromLeft)
//            self.visualEffectBlurView.slidingInFromWherever(duration: 0.25, whichDirection: .fromLeft)
        
    
