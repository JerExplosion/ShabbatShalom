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
    
 //   private var datePicker: UIDatePicker
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var eventDetailsTableView: UITableView!
    @IBOutlet weak var eventNameTextfield: UITextField!
    
    @IBOutlet weak var eventDateTextfield: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        generateDatePicker()
        
        eventNameTextfield.delegate = self
        eventDateTextfield.delegate = self
        eventDetailsTableView.delegate = self
        eventDetailsTableView.dataSource = self
        
        navigationItem.title = GlobalConstants.eViDetailsNavigationBarTitle
        
    }
    
    func generateDatePicker() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonPressed ))
        toolBar.setItems([doneButton], animated: true)
        eventDateTextfield.inputAccessoryView = toolBar
        eventDateTextfield.inputView = datePicker
        
        datePicker.datePickerMode = .date
    }
    
    @objc func doneButtonPressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .full

        eventDateTextfield.text = formatter.string(from: datePicker.date)
    //    view.endEditing(true)
        eventDateTextfield.resignFirstResponder()
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
    
    // MARK: - Slightly outdated  way of implementing UIDatePicker
    
    
//      datePicker?.datePickerMode = .date
//        datePicker?.addTarget(self, action: #selector(choosingDate(datePicker:)), for: .valueChanged)

//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(recognizer:)))

//   view.addGestureRecognizer(tapGesture)

//   eventDateTextfield.inputView = datePicker


//@objc func viewTapped(recognizer: UITapGestureRecognizer) {
//    view.endEditing(true)
//}

//@objc func choosingDate(datePicker: UIDatePicker) {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "MM/dd/yyyy"
//    eventDateTextfield.text = formatter.string(from: datePicker.date)
//    view.endEditing(true)
//}


