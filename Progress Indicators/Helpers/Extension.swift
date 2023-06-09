//
//  Extension.swift
//  Progress Indicators
//
//  Created by Aidin Ahmadian on 3/19/23.
//

import Foundation
import UIKit

extension UILabel {

    func startBlink() {
        UIView.animate(withDuration: 0.8,
                       delay:0.0,
              options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
                       animations: { self.alpha = 0.4 },
              completion: nil)
    }

    func stopBlink() {
        layer.removeAllAnimations()
        alpha = 1
    }
}

extension UIImageView {

    func startBlink() {
        UIView.animate(withDuration: 0.8,
                       delay:0.0,
              options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
                       animations: { self.alpha = 0.4 },
              completion: nil)
    }

    func stopBlink() {
        layer.removeAllAnimations()
        alpha = 1
    }
}

//extension UIButton {
//
//    func startBlink() {
//        UIView.animate(withDuration: 0.8,
//                       delay:0.0,
//              options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
//                       animations: { self.alpha = 0.5 },
//              completion: nil)
//    }
//
//    func stopBlink() {
//        layer.removeAllAnimations()
//        alpha = 1
//    }
//}

