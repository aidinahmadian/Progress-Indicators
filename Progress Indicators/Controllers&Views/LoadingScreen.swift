//
//  ThirdScreen.swift
//  Progress Indicators
//
//  Created by Aidin Ahmadian on 3/18/23.
//

import JGProgressHUD
import UIKit

class LoadingScreen: UIViewController {
    
    let dismissLabel: UILabel = {
        let label = UILabel()
        guard let customFont = UIFont(name: "Gilroy-ExtraBold", size: 17) else {
            fatalError("error")
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Swipe down to\ndismiss"
        return label
    }()
    
    let dismissIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "chevron")
        image.frame = CGRect(x: 0, y: 25, width: 50, height: 50)
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "modalBackgroundCustomColor")
        setupLabel()
        setupConstraint()
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.showExample()
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dismissLabel.startBlink()
        dismissIcon.startBlink()
        UILabel.animate(withDuration: 1.5, delay: 2.5, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: [], animations: {
            self.dismissLabel.transform = CGAffineTransform(translationX: 0, y: 25)
            self.dismissIcon.transform = CGAffineTransform(translationX: 0, y: 25)
                }, completion: nil)
        UILabel.animate(withDuration: 1.5, delay: 3.5, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: [], animations: {
            self.dismissLabel.transform = CGAffineTransform(translationX: 0, y: 0)
            self.dismissIcon.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: nil)
        UILabel.animate(withDuration: 1.5, delay: 4.5, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: [], animations: {
            self.dismissLabel.transform = CGAffineTransform(translationX: 0, y: 25)
            self.dismissIcon.transform = CGAffineTransform(translationX: 0, y: 25)
                }, completion: nil)
        UILabel.animate(withDuration: 1.5, delay: 5.5, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: [], animations: {
            self.dismissLabel.transform = CGAffineTransform(translationX: 0, y: 0)
            self.dismissIcon.transform = CGAffineTransform(translationX: 0, y: 0)
            //self.dismissLabel.transform = CGAffineTransform.identity
                }, completion: nil)
    }
    
    func showExample() {
        let hud = JGProgressHUD()
        hud.indicatorView = JGProgressHUDIndeterminateIndicatorView()
        guard let customFont = UIFont(name: "Gilroy-ExtraBold", size: 17) else {
            fatalError("error")
        }
        hud.textLabel.text = "Loading"
        hud.textLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        hud.textLabel.adjustsFontForContentSizeCategory = true
        hud.detailTextLabel.text = "Getting Everything Ready..."
        hud.detailTextLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        hud.detailTextLabel.adjustsFontForContentSizeCategory = true
        hud.textLabel.textColor = .systemBlue
        hud.show(in: view)
        hud.dismiss(afterDelay: 3)
    }
    
    func setupLabel() {
        view.addSubview(dismissLabel)
        view.addSubview(dismissIcon)
    }
    
    func setupConstraint() {
        dismissLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        dismissLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        dismissIcon.topAnchor.constraint(equalTo: dismissLabel.bottomAnchor).isActive = true
        dismissIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}

