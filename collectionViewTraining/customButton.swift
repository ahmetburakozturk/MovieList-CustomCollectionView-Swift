//
//  customButton.swift
//  collectionViewTraining
//
//  Created by ahmetburakozturk on 20.05.2023.
//

import UIKit
@IBDesignable

class customButton: UIButton {

    @IBInspectable var roundButton:Bool = false{
        didSet{
            if roundButton {
            }
            layer.cornerRadius = frame.size.height / 5.0
        }
    }
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.size.width / 5.0
        }
    }

}
