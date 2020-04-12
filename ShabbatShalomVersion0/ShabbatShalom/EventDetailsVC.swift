//
//  EventDetailsViewController.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 4/5/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation

class EventDetailsViewController: UIViewController {
    
    @IBOutlet weak var eventNameTextfield: UITextField!
    
    @IBOutlet weak var eventDateTextfield: UITextField!
    // can possibly use a UIDatePicker
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventNameTextfield.delegate = self
        eventDateTextfield.delegate = self
        
        navigationItem.title = GlobalConstants.eViDetailsNavigationBarTitle
        
    }
    
    @IBAction func saveEvent(_ sender: Any) {
        
        guard let eventName = eventNameTextfield.text else { return }
        guard let eventDate = eventDateTextfield.text else { return }
    
        eventNameEntered = eventName
        eventDateEntered = eventDate
        
        eventsContainerArray.append(eventName)
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let destination = mainStoryBoard.instantiateViewController(withIdentifier: "EventsViewController") as? EventsViewController else {
            print("destination not found")
            return
        }
        
        navigationController?.crossDissolve(destination)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
 //       eventDateTextfield.resignFirstResponder()
    }         
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}



//        let eventSpecifics = EventSpecificsModel(eventName: eventName, date: eventDate)
//        print(eventSpecifics)
 
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationViewController = segue.destination as! EventsViewController
//
//    }
    
    
    // alternative: (that doesn't involve the navigation stack)
//    destination.modalTransitionStyle = .partialCurl
//    present(destination, animated: true, completion: nil)
    
    
    
    
    
    
