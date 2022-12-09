//
//  GradiandView.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 10.12.2022.
//



import UIKit

@IBDesignable
class GradiandView : UIView {
    
    // MARK: - Variables
    
    override class var layerClass: AnyClass { CAGradientLayer.self }
    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }
    
    @IBInspectable var startColor: UIColor? {
        didSet {
            self.updateColors()
        }
    }
    
    @IBInspectable var endColor: UIColor? {
        didSet {
            self.updateColors()
        }
    }
    
    @IBInspectable var startLocation: CGFloat = 0.0 {
        didSet {
            self.updateLocations()
        }
    }
    
    @IBInspectable var endLocation: CGFloat = 1.0 {
        didSet {
            self.updateLocations()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = true {
        didSet {
            self.updatePoints()
        }
    }
    
    @IBInspectable var Image: UIImage! {
      get { return nil }  // maybe use associated objects, you can't add properties in extensions
      set {
        let imageView = UIImageView(image: newValue)
        imageView.frame = bounds
        imageView.contentMode =  .scaleAspectFit
        addSubview(imageView)
        sendSubviewToBack(imageView)
      }
    }
    
    // MARK: - Updates
    
    func updateColors() {
        self.gradientLayer.colors = [self.startColor?.cgColor, self.endColor?.cgColor]
    }
    
    func updateLocations() {
        self.gradientLayer.locations = [self.startLocation as NSNumber, self.endLocation as NSNumber]
    }
    
    func updatePoints() {
        if self.isHorizontal {
            self.gradientLayer.startPoint = .init(x: 1, y: 0)
            self.gradientLayer.endPoint = .init(x: 0, y: 1)
        } else {
            self.gradientLayer.startPoint = .init(x: 0, y: 0)
            self.gradientLayer.endPoint = .init(x: 1, y: 1)
        }
    }
    
    
    // MARK: - Setup
    
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updatePoints()
        updateLocations()
        updateColors()
    }
}
