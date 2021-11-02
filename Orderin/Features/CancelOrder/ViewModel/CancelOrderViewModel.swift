//
//  CancelOrderViewModel.swift
//  Orderin
//
//  Created by Azka Kusuma on 01/11/21.
//

import Foundation
import QuartzCore

class CancelOrderViewModel {
    
    let basicAnimation = CABasicAnimation(keyPath: Constant.CancelOrder.keypathAnimation)
   
    
    
    func animatedCircle(shapeLayer: CAShapeLayer, timeLeft: TimeInterval) {
        
        basicAnimation.toValue = 0
        basicAnimation.duration = timeLeft - 1
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "apaAja")
        
     
        
    }
}
