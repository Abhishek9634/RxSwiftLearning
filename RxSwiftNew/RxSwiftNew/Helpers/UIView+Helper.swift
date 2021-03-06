//
//  UIView+Helper.swift
//  Guardian
//
//  Created by Ravindra Soni on 18/12/16.
//  Copyright © 2016 Nickelfox. All rights reserved.
//

import UIKit

extension UIView {
	
	@IBInspectable var borderWidth: CGFloat {
		get {
			return 1.0
		} set {
			self.layer.borderWidth = newValue
		}
	}
	
	@IBInspectable var borderColor: UIColor {
		get {
			return UIColor.black
		} set {
			self.layer.borderColor = newValue.cgColor
		}
	}
	
	@IBInspectable var cornerRadius: CGFloat {
		get {
			return 1.0
		} set {
			self.layer.cornerRadius = newValue
			self.layer.masksToBounds = true
		}
	}
	
	func flipView() {
		let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
		
		UIView.transition(with: self, duration: 1.0, options: transitionOptions, animations: {
			self.isHidden = true
		}, completion: nil)
		
		UIView.transition(with: self, duration: 1.0, options: transitionOptions, animations: {
			self.isHidden = false
		}, completion: nil)
	}

    @IBInspectable var shadowColor: UIColor {
        get {
            return UIColor.clear
        } set {
            self.layer.masksToBounds = false
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        } set {
            self.layer.shadowRadius = newValue
            self.layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        } set {
            self.layer.shadowOffset = newValue
            self.layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        } set {
            self.layer.shadowOpacity = newValue
            self.layer.masksToBounds = false
        }
    }

}

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func setGradientColor() {
        self.layoutIfNeeded()
        let colors: [UIColor] = [UIColor(hexString: "1EADD3"), UIColor(hexString: "1199BD")]
        let gradientLayer = CAGradientLayer(frame: self.bounds, colors: colors)
        let bgView = UIView(frame: self.bounds)
        bgView.layer.addSublayer(gradientLayer)
        self.insertSubview(bgView, at: 0)
    }
}

extension UICollectionView {
    
    func setGradientBG() {
        let colors: [UIColor] = [UIColor(hexString: "1EADD3"), UIColor(hexString: "1199BD")]
        let bgView = UIView(frame: self.bounds)
        let gradientLayer = CAGradientLayer(frame: self.bounds, colors: colors)
        bgView.layer.addSublayer(gradientLayer)
        self.backgroundView = bgView
    }
}
