//
//  DownloadScreen.swift
//  Progress Indicators
//
//  Created by Aidin Ahmadian on 3/18/23.
//

import JGProgressHUD
import AVFoundation
import UIKit

class DownloadScreen: UIViewController {
    
    let systemSoundID: SystemSoundID = 1111
    
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
                }, completion: nil)
        self.dismissLabel.transform = CGAffineTransform.identity
        self.dismissIcon.transform = CGAffineTransform.identity
    }
    
    func showExample() {
        let hud = JGProgressHUD()
        hud.indicatorView = JGProgressHUDPieIndicatorView()
        hud.textLabel.text = "Downloading"
        guard let customFont = UIFont(name: "Gilroy-ExtraBold", size: 17) else {
            fatalError("error")
        }
        hud.textLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        hud.textLabel.adjustsFontForContentSizeCategory = true
        hud.textLabel.textColor = . systemBlue
        hud.detailTextLabel.text = "0%"
        hud.show(in: view)
        
        var progress: Float = 0.0
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            progress += 0.1
            hud.setProgress(progress, animated: true)
            let value: Float = progress / 1.0
            hud.detailTextLabel.text = "\(Int(value * 100.0))%"
            if progress > 1.0 {
                timer.invalidate()
                
                hud.indicatorView = JGProgressHUDSuccessIndicatorView()
                hud.textLabel.text = "Success!"
                hud.textLabel.textColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
                hud.textLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
                hud.textLabel.adjustsFontForContentSizeCategory = true
                hud.detailTextLabel.text = "Your file has been downloaded"
                hud.detailTextLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
                hud.detailTextLabel.adjustsFontForContentSizeCategory = true
                hud.dismiss(afterDelay: 2)
                AudioServicesPlaySystemSound(self.systemSoundID)
                let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .heavy)
                impactFeedbackgenerator.prepare()
                impactFeedbackgenerator.impactOccurred()
            }
        }
    }
    
    func setupLabel() {
        view.addSubview(dismissLabel)
        view.addSubview(dismissIcon)
    }
    
    func setupConstraint() {
        
        dismissLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        dismissLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        dismissIcon.topAnchor.constraint(equalTo: dismissLabel.bottomAnchor).isActive = true
        dismissIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}
