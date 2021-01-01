//
//  ImportFromPastGuestsViewController.swift
//  ShabbatShalom
//
//  Created by Jerry Ren on 4/26/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation


fileprivate var mockPastGuestsList = ["Dailan", "Holly", "Henry Lee", "Dr. Goldring", "Shiffball", "Dailan", "Angela", "Holly", "Aunt Rachel", "Kevin Fat", "Henry Lee", "Angela", "Holly", "Aunt Rachel", "Kevin Fat", "Henry Lee"]

class ImportFromPastGuestsViewController: UIViewController {
    
    @IBOutlet weak var importFromPastGTable: UITableView!
    
    var postFilteringGuestList: [String] = []

    var chequedOrNawArray = [Bool](repeating: false, count: mockPastGuestsList.count)
    
    var combinedImage: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        importFromPastGTable.delegate = self
        importFromPastGTable.dataSource = self
        
        postFilteringGuestList = mockPastGuestsList

        setCombinedImage()
        
        beautifyingTableViewBackground()
     }
    
    
    func setCombinedImage() {
        let outputSize = CGSize(width: 33, height: 33)
        
        if let imageOnTop = UIImage(named: "chequeMars512pixels.png")?.withRenderingMode(.alwaysOriginal) {
            if let imageUnderneath = UIImage(named: "chequeCirclePink96pixels.png")?.withRenderingMode(.alwaysOriginal) {
                if let overlappedImage = overlappingTwoIcons(onTop: imageOnTop, underneath
                    : imageUnderneath, desireSize: outputSize) {
                    
                    self.combinedImage = overlappedImage
                }
            }
        }
    }
    
    
}
    
    extension ImportFromPastGuestsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cello = importFromPastGTable.dequeueReusableCell(withIdentifier: GlobalConstants.importFromPastGuestsCell, for: indexPath) as! ImportFPastGTviCell

        cello.accessoryType = .disclosureIndicator
        
        let currentChequedOrNaw = chequedOrNawArray[indexPath.row]
        
        cello.chequeMarsImageView.image = !currentChequedOrNaw == true ? UIImage(named: "chequeCirclePink96pixels.png")?.withRenderingMode(.alwaysOriginal) :
            combinedImage

        cello.importGNamesCelloLabel.text = mockPastGuestsList[indexPath.row]

        return cello
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        chequedOrNawArray[indexPath.row] = !chequedOrNawArray[indexPath.row]
        print(chequedOrNawArray)
        
        importFromPastGTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postFilteringGuestList.count
    }
}


// MARK: - Extension functions for image processing

extension ImportFromPastGuestsViewController {
    
    private func stackTwoImagesVertically() { // may potentially be revised to generalize
        
        let imageHigh = UIImage(named: "chequeMars512pixels.png")?.withRenderingMode(.alwaysOriginal)
        let imageLow = UIImage(named: "chequeCirclePink96pixels.png")?.withRenderingMode(.alwaysOriginal)

        let size = CGSize(width: imageHigh!.size.width, height: imageHigh!.size.height + imageLow!.size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        imageHigh!.draw(in: CGRect(x: 0, y: 0, width: size.width, height: imageHigh!.size.height))
              
        imageLow!.draw(in: CGRect(x: 0, y: imageHigh!.size.height, width: size.width, height: imageLow!.size.height))

        var overlappedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.combinedImage = overlappedImage
    }
    
    
    func overlappingTwoIcons(onTop: UIImage, underneath: UIImage, desireSize: CGSize) -> UIImage? {

        UIGraphicsBeginImageContextWithOptions(desireSize, false, 0.0)
        
        underneath.draw(in: CGRect(origin: CGPoint.zero, size: desireSize))
        onTop.draw(in: CGRect(origin: CGPoint.zero, size: desireSize))
   
        let desiredImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return desiredImage
    }
}

// MARK: - Beautifying TableView Background

extension ImportFromPastGuestsViewController {
    
    func beautifyingTableViewBackground() {
        
        let bgImageView = UIImageView(image: UIImage(named: "AltoAoi"))
        bgImageView.contentMode = .scaleAspectFit
        importFromPastGTable.backgroundView = bgImageView
        let blurring = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurredView = UIVisualEffectView(effect: blurring)
        blurredView.frame = bgImageView.bounds
        bgImageView.addSubview(blurredView)
    }
}

     
         
