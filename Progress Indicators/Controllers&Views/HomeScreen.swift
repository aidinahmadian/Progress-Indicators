//
//  HomeScreen.swift
//  Progress Indicators
//
//  Created by Aidin Ahmadian on 3/18/23.
//

import UIKit
import AVFoundation

class HomeScreen: UIViewController {
    
    let firstImage: UIImageView = {
        let fi = UIImageView()
        fi.image = UIImage(named: "firstpic")
        fi.contentMode = .scaleAspectFit
        fi.translatesAutoresizingMaskIntoConstraints = false
        return fi
    }()
    
    let secondImage: UIImageView = {
        let si = UIImageView()
        si.image = UIImage(named: "secondpic")
        si.contentMode = .scaleAspectFit
        si.translatesAutoresizingMaskIntoConstraints = false
        return si
    }()
    
    let topRightLabel: UILabel = {
        // Using -createSTR- function in -HomeVCFunctions-
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        guard let customFont = UIFont(name: "Gilroy-ExtraBold", size: 24) else {
            fatalError("error")
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "Progress Indicator!"
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    lazy var downloadingIndicatorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "BottonsCustomColor")
        button.layer.cornerRadius = 8
        button.setTitle("Download Indicator", for: .normal)
        button.titleLabel?.font = UIFont(name: "Gilroy-ExtraBold", size: 17)
        button.setTitleColor(UIColor(named: "textCustomColor"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapDownloading), for: .touchUpInside)
        return button
    }()
    
    lazy var loadingIndicatorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "BottonsCustomColor")
        button.layer.cornerRadius = 8
        button.setTitle("Loading Indicator", for: .normal)
        button.titleLabel?.font = UIFont(name: "Gilroy-ExtraBold", size: 17)
        button.setTitleColor(UIColor(named: "textCustomColor"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapLoading), for: .touchUpInside)
        return button
    }()
    
    lazy var errorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "BottonsCustomColor")
        button.layer.cornerRadius = 8
        button.setTitle("Error Alert", for: .normal)
        button.titleLabel?.font = UIFont(name: "Gilroy-ExtraBold", size: 17)
        button.setTitleColor(UIColor(named: "textCustomColor"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapError), for: .touchUpInside)
        return button
    }()
    
    lazy var toggleInterfaceStyleButton: UIButton = {
        let button:UIButton = UIButton(type: UIButton.ButtonType.custom)
        let imageSize:CGSize = CGSize(width: 24, height: 24)
        button.frame = CGRect(x: 0, y: 0, width: 55, height: 55)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "BottonsCustomColor")
        //button.backgroundColor = #colorLiteral(red: 0.982663691, green: 0.2891436517, blue: 0.5054450035, alpha: 1)
        button.setImage(UIImage(named: "DayAndNight"), for: UIControl.State.normal)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(toggleInterfaceStyle), for: .touchUpInside)
        button.imageEdgeInsets = UIEdgeInsets(
            top: (button.frame.size.height - imageSize.height) / 2,
            left: (button.frame.size.width - imageSize.width) / 2,
            bottom: (button.frame.size.height - imageSize.height) / 2,
            right: (button.frame.size.width - imageSize.width) / 2)
        return button
    }()
    
    lazy var infoButton: UIButton = {
        let button:UIButton = UIButton(type: UIButton.ButtonType.custom)
        let imageSize:CGSize = CGSize(width: 24, height: 24)
        button.frame = CGRect(x: 0, y: 0, width: 55, height: 55)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "BottonsCustomColor")
        //button.backgroundColor = #colorLiteral(red: 0.982663691, green: 0.2891436517, blue: 0.5054450035, alpha: 1)
        button.setImage(UIImage(named: "info"), for: UIControl.State.normal)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapInfo), for: .touchUpInside)
        button.imageEdgeInsets = UIEdgeInsets(
            top: (button.frame.size.height - imageSize.height) / 2,
            left: (button.frame.size.width - imageSize.width) / 2,
            bottom: (button.frame.size.height - imageSize.height) / 2,
            right: (button.frame.size.width - imageSize.width) / 2)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupConstraints()
        view.backgroundColor = UIColor(named: "backgroundCustomColor")
    }
    
    func setupButton() {
        view.addSubview(firstImage)
        view.addSubview(secondImage)
        view.addSubview(downloadingIndicatorButton)
        view.addSubview(loadingIndicatorButton)
        view.addSubview(errorButton)
        view.addSubview(toggleInterfaceStyleButton)
        view.addSubview(infoButton)
        view.addSubview(topRightLabel)
    }
    
    func setupConstraints() {
        loadingIndicatorButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        loadingIndicatorButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loadingIndicatorButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingIndicatorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        downloadingIndicatorButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        downloadingIndicatorButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        downloadingIndicatorButton.bottomAnchor.constraint(equalTo: loadingIndicatorButton.topAnchor, constant: -10).isActive = true
        downloadingIndicatorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        errorButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        errorButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        errorButton.topAnchor.constraint(equalTo: loadingIndicatorButton.bottomAnchor, constant: 10).isActive = true
        errorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        firstImage.bottomAnchor.constraint(equalTo: downloadingIndicatorButton.topAnchor, constant: -10).isActive = true
        firstImage.topAnchor.constraint(equalTo: topRightLabel.topAnchor).isActive = true
        firstImage.trailingAnchor.constraint(equalTo: topRightLabel.leadingAnchor, constant: -10).isActive = true
        firstImage.widthAnchor.constraint(equalToConstant: 230).isActive = true
        
        secondImage.topAnchor.constraint(equalTo: errorButton.bottomAnchor, constant: 10).isActive = true
        secondImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        secondImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 80).isActive = true
        secondImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        toggleInterfaceStyleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -45).isActive = true
        toggleInterfaceStyleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        toggleInterfaceStyleButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        toggleInterfaceStyleButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
        
        infoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -45).isActive = true
        infoButton.leadingAnchor.constraint(equalTo: toggleInterfaceStyleButton.trailingAnchor, constant: 15).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
        
        topRightLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topRightLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
    }
    
    @objc func didTapDownloading() {
        let vc = DownloadScreen()
        vc.title = "Downloading"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true, completion: nil)
        vc.sheetPresentationController?.prefersGrabberVisible = true
//        let delay : Double = 4.0
//        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//            self.dismiss(animated: true, completion: nil)
//        }
    }
    
    @objc func didTapLoading() {
        let vc = LoadingScreen()
        vc.title = "Loading"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.modalTransitionStyle = .coverVertical
        vc.sheetPresentationController?.prefersGrabberVisible = true
        //navigationController?.pushViewController(vc, animated: true)
        present(vc, animated: true, completion: nil)
        
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .soft)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
    
    @objc func didTapError() {
        let vc = ErrorScreen()
        vc.title = "Error"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.modalTransitionStyle = .coverVertical
        vc.sheetPresentationController?.prefersGrabberVisible = true
        //navigationController?.pushViewController(vc, animated: true)
        present(vc, animated: true, completion: nil)
    }
    
    @objc func toggleInterfaceStyle() {
        UIButton.animate(withDuration: 0.4, animations: ({
            self.toggleInterfaceStyleButton.transform = self.toggleInterfaceStyleButton.transform.rotated(by: CGFloat(Double.pi / 2))
            self.toggleInterfaceStyleButton.transform = CGAffineTransformRotate(self.toggleInterfaceStyleButton.transform, CGFloat(Double.pi / 2))
        }))
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let interfaceStyle = window?.overrideUserInterfaceStyle == .unspecified ? UIScreen.main.traitCollection.userInterfaceStyle : window?.overrideUserInterfaceStyle
        
        if interfaceStyle != .dark {
            window?.overrideUserInterfaceStyle = .dark
        } else {
            window?.overrideUserInterfaceStyle = .light
        }
    }
    
    @objc func didTapInfo() {
        UIButton.animate(withDuration: 0.4, animations: ({
            self.infoButton.transform = self.infoButton.transform.scaledBy(x: 2, y: 2)
            self.infoButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        }))
        let vc = InfoScreen()
        vc.title = "Downloading"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true, completion: nil)
        vc.sheetPresentationController?.prefersGrabberVisible = true
    }
    
}
