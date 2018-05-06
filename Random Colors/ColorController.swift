//
//  ColorController.swift
//  Random Colors
//
//  Created by Pankaj Sharma on 5/3/18.
//  Copyright © 2018 Pankaj Sharma. All rights reserved.
//

import UIKit

protocol Colors {
    func mybackgroundColor(color: UIColor)
}

class ColorController: UIViewController {
    
    var delegate: Colors?

    @IBAction func magicButton(_ sender: Any) {
    
       self.delegate?.mybackgroundColor(color: self.view.backgroundColor!)
        dismiss(animated: true) 
        
    }
    var newbackgroundColor: UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newbackgroundColor = view.backgroundColor

    }

    
   
}
