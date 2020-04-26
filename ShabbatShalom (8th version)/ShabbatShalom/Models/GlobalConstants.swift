//
//  GlobalConstants.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 4/3/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

public struct GlobalConstants {
    
    static let cellIdentity = "cello"
    static let eventsCell = "eventsCello"
    static let guestsHistoryCell = "guestsCollectionCello"
    static let menusHistoryCell = "menusCollectionCello"
    static let importFromPastGuestsCell = "importFromGuestsCello"
    
    static var guestDetailsNavigationBarTitle = "Mystery Guest"
    static var eViDetailsNavigationBarTitle = "Tell us More"
    
    static let eventDetailVCStoryboardID = "EventDetailsViewController"
    static let eventsVCStoryboardID = "EventsViewController"
    static let guestListVCStoryboardID = "GuestListViewController"
    static let guestDetailsVCStoryboardID = "GuestDetailsViewController"
    static let recipesVCStoryboardID = "RecipesViewController"
}

public var eventNameEntered = "Initial event"
public var eventDateEntered = "no date entered yet"


// MARK: - previously used global properties
//static let subsequentVCIdentity = "SubsequentVC"
//static var subsequentNavigationBarTitle = "Mystery Guest"
