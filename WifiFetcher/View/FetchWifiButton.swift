//
//  FetchWifiButton.swift
//  WifiFetcher
//
//  Created by Admin on 22.09.2024.
//

import UIKit
import SnapKit

protocol FetchWifiButtonDelegate: AnyObject {
    func revertButtonState()
}

final class FetchWifiButton: UIView {
    
    var backgroundDimension: CGFloat = 320
    var tertiaryDimension: CGFloat = 260
    var secondaryDimension: CGFloat = 210
    var primaryDimension: CGFloat = 160
    lazy var backgroundCornerRadius: CGFloat = backgroundDimension/2
    lazy var tertiaryCornerRadius = backgroundCornerRadius - 60/2
    
    private let wifiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Wi-Fi")
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let primaryCircle: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.primaryGreyButton
        return view
    }()
    
    private let secondaryCircle: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.secondaryGreyButton
        return view
    }()
    
    private let tertiaryCircle: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.tertiaryGreyButton
        return view
    }()
    
    private let backgroundCircle: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.backgroundGreyButton
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapButton))
        addGestureRecognizer(tap)
        setUp()
    }
    
    @objc func didTapButton() {
        action?()
        startInfiniteAnimation()
    }
    
    var action: (()->())?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setAppearance() {
        backgroundCircle.layer.cornerRadius = backgroundCornerRadius
        tertiaryCircle.layer.cornerRadius = tertiaryCornerRadius
        secondaryCircle.layer.cornerRadius = 105
        primaryCircle.layer.cornerRadius = 80
        
        backgroundCircle.backgroundColor = Colors.backgroundGreyButton
        tertiaryCircle.backgroundColor = Colors.tertiaryGreyButton
        secondaryCircle.backgroundColor = Colors.secondaryGreyButton
        primaryCircle.backgroundColor = Colors.primaryGreyButton
        
        addSubview(backgroundCircle)
        backgroundCircle.addSubview(tertiaryCircle)
        tertiaryCircle.addSubview(secondaryCircle)
        secondaryCircle.addSubview(primaryCircle)
        primaryCircle.addSubview(wifiImageView)
    }
    
    func setUp() {
        
        setAppearance()
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        primaryCircle.snp.makeConstraints { make in
            make.width.height.equalTo(primaryDimension)
            make.center.equalTo(secondaryCircle)
        }
        
        secondaryCircle.snp.makeConstraints { make in
            make.width.height.equalTo(secondaryDimension)
            make.center.equalTo(tertiaryCircle)
        }
        
        tertiaryCircle.snp.makeConstraints { make in
            make.width.height.equalTo(tertiaryDimension)
            make.center.equalTo(backgroundCircle)
        }
        
        backgroundCircle.snp.makeConstraints { make in
            make.width.height.equalTo(backgroundDimension)
            make.center.equalToSuperview()
        }
        
        wifiImageView.snp.makeConstraints { make in
            make.center.equalTo(primaryCircle)
            make.height.width.equalTo(100)
        }
    }
    
    private func remakeConstraints() {
        primaryCircle.snp.remakeConstraints { make in
            make.width.height.equalTo(primaryDimension)
            make.center.equalTo(secondaryCircle)
        }
        self.primaryCircle.layoutIfNeeded()
        
        secondaryCircle.snp.remakeConstraints { make in
            make.width.height.equalTo(secondaryDimension)
            make.center.equalTo(tertiaryCircle)
        }
        self.secondaryCircle.layoutIfNeeded()
        
        tertiaryCircle.snp.remakeConstraints { make in
            make.width.height.equalTo(tertiaryDimension)
            make.center.equalTo(backgroundCircle)
        }
        self.tertiaryCircle.layoutIfNeeded()
        
        backgroundCircle.snp.remakeConstraints { make in
            make.width.height.equalTo(backgroundDimension)
            make.center.equalToSuperview()
        }
        self.backgroundCircle.layoutIfNeeded()
        
        wifiImageView.snp.remakeConstraints { make in
            make.center.equalTo(primaryCircle)
            make.height.width.equalTo(100)
        }
        self.wifiImageView.layoutIfNeeded()
    }
    
    var loaded = false
    
    func startInfiniteAnimation() {
        animateButton { [weak self] in
            self?.animateShrinkButton()
        }
    }
    
    func animateButton(completion: (()->())? = nil) {
        //1
        self.primaryCircle.snp.remakeConstraints { make in
            make.width.height.equalTo(180)
            make.center.equalTo(self.secondaryCircle)
        }
        
        UIView.animate(withDuration: 1/2) {
            self.primaryCircle.layoutIfNeeded()
            self.primaryCircle.backgroundColor = Colors.primaryGreenButton
        }
        primaryCircle.animateCornerRadius(from: 80, to: 90, duration: 1/2)

        //2
        secondaryCircle.snp.remakeConstraints { make in
            make.width.height.equalTo(230)
            make.center.equalTo(tertiaryCircle)
        }
        
        UIView.animate(withDuration: 1/2, delay: 0.3/2) {
            self.secondaryCircle.layoutIfNeeded()
            self.secondaryCircle.backgroundColor = Colors.secondaryGreenButton
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3/2, execute: {
            self.secondaryCircle.animateCornerRadius(from: 105, to: 115, duration: 1/2)
        })
        
        //3
        tertiaryCircle.snp.remakeConstraints { make in
            make.width.height.equalTo(280)
            make.center.equalTo(backgroundCircle)
        }
        UIView.animate(withDuration: 1/2, delay: 0.6/2) {
            self.tertiaryCircle.layoutIfNeeded()
            self.tertiaryCircle.backgroundColor = Colors.tertiaryGreenButton
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6/2, execute: {
            self.tertiaryCircle.animateCornerRadius(from: 130, to: 140, duration: 1/2)
            
            
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7/2, execute: {
            guard !self.loaded else { return }
            completion?()
        })
    }
    
    func animateShrinkButton() {
        //1
        self.primaryCircle.snp.remakeConstraints { make in
            make.width.height.equalTo(160)
            make.center.equalTo(self.secondaryCircle)
        }
        
        UIView.animate(withDuration: 1/2) {
            self.primaryCircle.layoutIfNeeded()
            self.primaryCircle.backgroundColor = Colors.primaryGreenButton
        }
        primaryCircle.animateCornerRadius(from: 90, to: 80, duration: 1/2)

        //2
        secondaryCircle.snp.remakeConstraints { make in
            make.width.height.equalTo(210)
            make.center.equalTo(tertiaryCircle)
        }
        
        UIView.animate(withDuration: 1/2, delay: 0.3/2) {
            self.secondaryCircle.layoutIfNeeded()
            self.secondaryCircle.backgroundColor = Colors.secondaryGreenButton
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3/2, execute: {
            self.secondaryCircle.animateCornerRadius(from: 115, to: 105, duration: 1/2)
        })
        
        //3
        tertiaryCircle.snp.remakeConstraints { make in
            make.width.height.equalTo(260)
            make.center.equalTo(backgroundCircle)
        }
        UIView.animate(withDuration: 1/2, delay: 0.6/2) {
            self.tertiaryCircle.layoutIfNeeded()
            self.tertiaryCircle.backgroundColor = Colors.tertiaryGreenButton
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6/2, execute: {
            self.tertiaryCircle.animateCornerRadius(from: 140, to: 130, duration: 1/2)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7/2, execute: {
        self.animateButton()
        })
    }
}

extension FetchWifiButton: FetchWifiButtonDelegate {
    func revertButtonState() {
        setAppearance()
        remakeConstraints()
    }
}

extension UIView
{
    func animateCornerRadius(from: CGFloat, to: CGFloat, duration: CFTimeInterval)
    {
        DispatchQueue.main.async {
            CATransaction.begin()
            let animation = CABasicAnimation(keyPath: "cornerRadius")
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            animation.fromValue = from
            animation.toValue = to
            animation.duration = duration
            
            CATransaction.setCompletionBlock { [weak self] in
                self?.layer.cornerRadius = to
            }
            self.layer.add(animation, forKey: "cornerRadius")
            CATransaction.commit()
        }
    }
}
