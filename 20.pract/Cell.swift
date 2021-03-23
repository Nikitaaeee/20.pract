//
//  Cell.swift
//  20.pract
//
//  Created by Никита on 23.03.2021.
//

import UIKit

class Cell: UICollectionViewCell {
    
    @IBOutlet weak var temperatureImage: UIImageView!
    
    @IBOutlet weak var smileImage: UIImageView!
    
    func setTemperatureImage(tempName: String) {
        temperatureImage.image = UIImage(named: tempName)
    }
    
    func setSmileImage(smileName: String) {
        smileImage.image = UIImage(named: smileName)
    }
}
