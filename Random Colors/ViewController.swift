//
//  ViewController.swift
//  Random Colors
//
//  Created by Pankaj Sharma on 5/3/18.
//  Copyright © 2018 Pankaj Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

   var randomColorsArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createRandomColor()
        }
    
    
    func createRandomColor() {
       for _ in 0...49 {
            let redRandom = CGFloat(arc4random_uniform(UInt32(255)))/255
            let greenRandom = CGFloat(arc4random_uniform(UInt32(255)))/255
            let blueRandom = CGFloat(arc4random_uniform(UInt32(255)))/255

            let randomColor = UIColor(red: redRandom, green: greenRandom, blue: blueRandom, alpha: 1)
            randomColorsArray.append(randomColor)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomColorsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
        
        cell.backgroundColor = randomColorsArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = randomColorsArray[indexPath.row]
        performSegue(withIdentifier: "segue", sender: cell)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let colorController = segue.destination as! ColorController
            colorController.view.backgroundColor = sender as? UIColor
            
        }
    }

}

