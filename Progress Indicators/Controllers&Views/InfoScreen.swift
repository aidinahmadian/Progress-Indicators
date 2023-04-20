//
//  InfoScreen.swift
//  Progress Indicators
//
//  Created by Aidin Ahmadian on 3/20/23.
//

import UIKit
import SafariServices

class InfoScreen: UIViewController {
    
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
    
    lazy var firstGitHubButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "BottonsCustomColor2")
        button.layer.cornerRadius = 8
        button.setTitle("My GitHub Account", for: .normal)
        button.titleLabel?.font = UIFont(name: "Gilroy-ExtraBold", size: 17)
        button.setTitleColor(UIColor(named: "textCustomColor"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 12,left: 12,bottom: 12,right: 12)
        button.semanticContentAttribute = .forceLeftToRight
        button.setImage(UIImage(named:"github"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(myGithubButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var secondGitHubButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "BottonsCustomColor2")
        button.layer.cornerRadius = 8
        button.setTitle("JonasG's GitHub Account", for: .normal)
        button.titleLabel?.font = UIFont(name: "Gilroy-ExtraBold", size: 17)
        button.setTitleColor(UIColor(named: "textCustomColor"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 12,left: 12,bottom: 12,right: 12)
        button.semanticContentAttribute = .forceLeftToRight
        button.setImage(UIImage(named:"github"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(jonasGithubButtonAction), for: .touchUpInside)
        return button
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        guard let customFont = UIFont(name: "Gilroy-ExtraBold", size: 12) else {
            fatalError("error")
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Created by: Aidin. on Mar 20 - 2023"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "modalBackgroundCustomColor")
        setupViews()
        setupConstraints()
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
    
    func setupViews() {
        view.addSubview(dismissLabel)
        view.addSubview(dismissIcon)
        view.addSubview(firstGitHubButton)
        view.addSubview(secondGitHubButton)
        view.addSubview(infoLabel)
    }
    
    func setupConstraints() {
        dismissLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        dismissLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        dismissIcon.topAnchor.constraint(equalTo: dismissLabel.bottomAnchor).isActive = true
        dismissIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        firstGitHubButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstGitHubButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 45).isActive = true
        firstGitHubButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -45).isActive = true
        firstGitHubButton.topAnchor.constraint(equalTo: dismissIcon.bottomAnchor, constant: 50).isActive = true
        firstGitHubButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        secondGitHubButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 45).isActive = true
        secondGitHubButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -45).isActive = true
        secondGitHubButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        secondGitHubButton.topAnchor.constraint(equalTo: firstGitHubButton.bottomAnchor, constant: 15).isActive = true
        secondGitHubButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
    }
    
    func showSafariVC(for url: String) {
            guard let url = URL(string: url) else {
                return
            }
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true)
        }
    
    @objc func myGithubButtonAction() {
            showSafariVC(for: "https://github.com/aidinahmadian")
        }
    
    @objc func jonasGithubButtonAction() {
            showSafariVC(for: "https://github.com/JonasGessner/JGProgressHUD")
        }
    
}
