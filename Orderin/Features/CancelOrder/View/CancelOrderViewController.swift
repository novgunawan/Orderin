//
//  CancelOrderViewController.swift
//  Orderin
//
//  Created by Azka Kusuma on 28/10/21.
//

import UIKit

class CancelOrderViewController: UIViewController {

    let bgShapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    var timeLabel =  UILabel()
    var timeLeft: TimeInterval = 5
    let viewModel = CancelOrderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCircle()
        addTimeLabel()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        viewModel.animatedCircle(shapeLayer: bgShapeLayer,timeLeft: timeLeft)
    }
    
    func getCircle() {
        //Path
        let center = view.center
        let path = UIBezierPath(arcCenter: center, radius: 150, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        bgShapeLayer.path = path.cgPath
        
        bgShapeLayer.fillColor = UIColor.clear.cgColor
        bgShapeLayer.strokeColor = UIColor.red.cgColor
        
        bgShapeLayer.lineWidth = 25
        bgShapeLayer.strokeEnd = 1
       
        // Track
        trackLayer.path = path.cgPath
        
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = UIColor(named: "cancelOrderTrackColor")?.cgColor
        
        trackLayer.lineWidth = 25
        
       
        view.layer.addSublayer(trackLayer)
        view.layer.addSublayer(bgShapeLayer)
    }
    
    func addTimeLabel() {
        timeLabel = UILabel(frame: CGRect(x: view.frame.midX-50 ,y: view.frame.midY-25, width: 100, height: 50))
        timeLabel.textAlignment = .center
        timeLabel.text = timeLeft.time
        view.addSubview(timeLabel)
    }
    
    
    
}
extension TimeInterval {
    var time: String {
        return String(format:"%02d:%02d", Int(self/60),  Int(ceil(truncatingRemainder(dividingBy: 60))) )
    }
}
