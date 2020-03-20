//
//  CustomProgressBar.swift
//
//  Created by Bharat Lalwani on 24/11/18.

import UIKit
class CircularProgressView: UIView ,CAAnimationDelegate{
    
    let circularLayer = CAShapeLayer()
    let progressbarRadius = 23.0 as CGFloat
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        self.backgroundColor = UIColor(white: 0, alpha: 0.4)
//        let imageView = UIImageView(image: #imageLiteral(resourceName: "ic_logo_white"))
//        imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        imageView.center = self.center
//        self.addSubview(imageView)
        
        circularLayer.lineWidth = 4.0
        circularLayer.fillColor = nil
        layer.addSublayer(circularLayer)
    }
    
    let inAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        return animation
    }()
    
    let outAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.beginTime = 0.5
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        return animation
    }()
    
    let rotationAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0.0
        animation.toValue = 2 * Double.pi
        animation.duration = 2.0
        animation.repeatCount = MAXFLOAT
        return animation
    }()
    
    var colorIndex : Int = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        //        let radius = min(bounds.width, bounds.height) / 2 - circularLayer.lineWidth / 2
        let radius = progressbarRadius - (circularLayer.lineWidth / 2)
        
        let arcPath = UIBezierPath(arcCenter: .zero, radius: radius, startAngle: CGFloat(Double.pi/2), endAngle: CGFloat(Double.pi/2 + (2 * Double.pi)), clockwise: true)
        
        circularLayer.position = center
        circularLayer.path = arcPath.cgPath
        
        animateProgressView()
        
        circularLayer.add(rotationAnimation, forKey: "rotateAnimation")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if(flag) {
//            animateProgressView()
        }
    }
    
    func animateProgressView() {
        circularLayer.removeAnimation(forKey: "strokeAnimation")
        circularLayer.strokeColor = UIColor.orange.cgColor
        let strokeAnimationGroup = CAAnimationGroup()
        strokeAnimationGroup.duration = 1.0 + outAnimation.beginTime
        strokeAnimationGroup.repeatCount = .infinity
        strokeAnimationGroup.animations = [inAnimation, outAnimation]
        strokeAnimationGroup.delegate = self
        circularLayer.add(strokeAnimationGroup, forKey: "strokeAnimation")
    }
}
