//
//  NewzViewC.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 5/7/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class NewzViewC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewzPulling()
    }
    
    func NewzPulling() {
        let url = URL(string: GlobalConstants.newzURL)
// changing http to https worked magic haha
        guard url != nil else { return }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                let newzDecoder = JSONDecoder()

                do {
                    let newzFeed = try newzDecoder.decode(Newzfeed.self, from: data!)
                    print(newzFeed.articles![0].content)
                } catch {
                    print("error parsing newzFeed Json")
                }
            }
        }
        dataTask.resume()
 
    }
}
