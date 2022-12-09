//
//  ProgressBar.swift
//  Herd Tracking
//
//  Created by ibrahim eryılmaz on 2.12.2022.
//

import Foundation
import UIKit

class ProgressBar : UIView {
    @IBInspectable public lazy var backgroundCircleColor: UIColor = .black
    @IBInspectable public lazy var foregroundCircleColor: UIColor = .init(red: 129, green: 12, blue: 168)
    @IBInspectable public lazy var startGradientColor: UIColor = .init(red: 229, green: 184, blue: 224)
    @IBInspectable public lazy var endGradientColor: UIColor = .init(red: 129, green: 12, blue: 168)
    @IBInspectable public lazy var textColor: UIColor = UIColor.white
    
    private lazy var fillColor: UIColor = UIColor.clear
    
    private var backgroundLayer: CAShapeLayer!
    private var progressLayer: CAShapeLayer!
     var textLayer: CATextLayer!
    
    public var progress: CGFloat = 0 {
      didSet {
        didProgressUpdated()
      }
    }
    
    public var animationDidStarted: (()->())?
    public var animationDidCanceled: (()->())?
    public var animationDidStopped: (()->())?
    
//    trackLayer.lineWidth = 25
// shapeLayer.lineWidth = 10
//    private var timer: AppTimer?
    private var isAnimating = false
//    private let tickInterval = 0.1
    
    public var maxDuration: Int = 3
    
    
    override func draw(_ rect: CGRect) {
      
      guard layer.sublayers == nil else {
        return
      }
      
      let lineWidth = min(frame.size.width, frame.size.height) * 0.1
      
      backgroundLayer = createCircularLayer(strokeColor: backgroundCircleColor.cgColor, fillColor: fillColor.cgColor, lineWidth: lineWidth)
      
      progressLayer = createCircularLayer(strokeColor: foregroundCircleColor.cgColor, fillColor: fillColor.cgColor, lineWidth: lineWidth)
      progressLayer.strokeEnd = progress
        progressLayer.lineWidth = 10
      let gradientLayer = CAGradientLayer()
      gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
      gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
      
      gradientLayer.colors = [startGradientColor.cgColor, endGradientColor.cgColor]
      gradientLayer.frame = self.bounds
      gradientLayer.mask = progressLayer
   
      textLayer = createTextLayer(textColor: textColor)
      
      layer.addSublayer(backgroundLayer)
      layer.addSublayer(gradientLayer)
      layer.addSublayer(textLayer)
    }
    
    private func createCircularLayer(strokeColor: CGColor, fillColor: CGColor, lineWidth: CGFloat) -> CAShapeLayer {
      
      let startAngle = -CGFloat.pi / 2
      let endAngle = 2 * CGFloat.pi + startAngle
      
      let width = frame.size.width
      let height = frame.size.height
      
        let center = CGPoint(x: width / 2, y: height / 2)
      let radius = (min(width, height) - lineWidth) / 2
      
      let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
      
      let shapeLayer = CAShapeLayer()
      
      shapeLayer.path = circularPath.cgPath
      
      shapeLayer.strokeColor = strokeColor
      shapeLayer.lineWidth = lineWidth
      shapeLayer.fillColor = fillColor
      shapeLayer.lineCap = .round
      
      return shapeLayer
    }
    
    private func createTextLayer(textColor: UIColor) -> CATextLayer {
      
      let width = frame.size.width
      let height = frame.size.height
      
      let fontSize = min(width, height) / 4 - 5
      let offset = min(width, height) * 0.1
      
      let layer = CATextLayer()
        
        if Constants.progressCow.reproductiveStatus?.name == "Gebe" || Constants.progressCow.reproductiveStatus?.name == "Kuruda" || Constants.progressCow.reproductiveStatus?.name == "Yakın Gebe" {
            for i in Constants.progressCow.inseminations{
                if i.inseminationsStatus == "Başarılı"{
                    var date = i.inseminationDate
                    layer.string = "\(NumberOfDays.dateDayCount(date: date))\n Günlük"
                }
            }
        }
        
        
      
      layer.backgroundColor = UIColor.clear.cgColor
      layer.foregroundColor = textColor.cgColor
        layer.fontSize = fontSize / 2.5
      layer.frame = CGRect(x: 0, y: (height - fontSize - offset) / 2, width: width, height: height)
      layer.alignmentMode = .center
      
      return layer
    }
    
    private func didProgressUpdated() {
      
//      textLayer?.string = "\(Int(progress * 100))"
      progressLayer?.strokeEnd = progress
    }
  }

  // Animation

  extension ProgressBar {
    
    func startAnimation(duration: TimeInterval) {
      
      print("Start animation")
      isAnimating = true
      
      progressLayer.removeAllAnimations()
      
      let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
      basicAnimation.duration = duration
      basicAnimation.toValue = progress
      
      basicAnimation.delegate = self
//        textLayer.string = "50"
//      timer = AppTimer(duration: maxDuration, tickInterval: tickInterval)
      
//      timer?.timerFired = { [weak self] value in
//        self?.textLayer.string = "\(value)"
      }
//
//      timer?.timerStopped = { [weak self] in
//        self?.textLayer.string = ""
//      }
//
//      timer?.timerCompleted = {}
//
//      progressLayer.add(basicAnimation, forKey: "recording")
//      timer?.start()
    }
    
//    func stopAnimation() {
//      timer?.stop()
//      progressLayer.removeAllAnimations()
//    }
    


  extension ProgressBar: CAAnimationDelegate {
    
    func animationDidStart(_ anim: CAAnimation) {
      animationDidStarted?()
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
      isAnimating = false
      flag ? animationDidStopped?() : animationDidCanceled?()
    }
    
}
