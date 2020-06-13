//
//  MeiMinusUno.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 4/30/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation
import os.log

// MARK: - reference S-S Simulator from a month ago

    
extension UIViewController {
    
    func dispatch() {

        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        ITerGer.shared.APICaller(using: "some custom URL") { (data, _) in
            defer { dispatchGroup.leave() }
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                // fill in the blank with some customized codable operations
            }
            catch {
                os_log("Error: ", error.localizedDescription)
            }
        }
        dispatchGroup.notify(queue: .main) {
           // reload teburu, UI animations & stuff
        }
    }
}
