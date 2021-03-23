//
//  ViewController.swift
//  20.pract
//
//  Created by Никита on 23.03.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionViewOne: UICollectionView!
    
    @IBOutlet weak var collectionViewTwo: UICollectionView!
    
    let arrayTemperature = ["temp.green",
    "temp.blackGreen",
    "temp.lightYellow",
    "temp.darkYellow",
    "temp.orange",
    "temp.red"]
    
    let arraySmile = ["routine",
    "hate",
    "bad",
    "favorite",
    "notPleasant",
    "nice"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        // Do any additional setup after loading the view.
        collectionViewTwo.delegate = self
        collectionViewTwo.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ShowImageVC") as? ShowImageVC
        else {return}
        
        var currentSelectedImage: String!
        
        if collectionView == collectionViewOne {currentSelectedImage = arrayTemperature[indexPath.row]}
        if collectionView == collectionViewTwo {currentSelectedImage =
            arraySmile[indexPath.row]
        }
        
        vc.setImage(name: currentSelectedImage)
        
        present(vc, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        if collectionView == collectionViewOne {
            return arrayTemperature.count
        }
        if collectionView == collectionViewTwo {
            return arraySmile.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewOne {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellOne", for: indexPath) as? Cell {
            let imageName = arrayTemperature[indexPath.row]
            cell.setTemperatureImage(tempName: imageName)
            return cell
        }
            if collectionView == collectionViewTwo {
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTwo", for: indexPath) as? Cell {
                    let imageName = arraySmile[indexPath.row]
                    cell.setSmileImage(smileName: imageName)
                    return cell
                }
            }
        }
        return UICollectionViewCell()
    }


}

