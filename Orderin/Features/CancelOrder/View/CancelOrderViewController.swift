//
//  CancelOrderViewController.swift
//  Orderin
//
//  Created by Azka Kusuma on 28/10/21.
//

import UIKit

class CancelOrderViewController: UIViewController {
    
    // Buat Circle
    let bgShapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    var timeLabel =  UILabel()
    var timeLeft: TimeInterval = 5
    var timeLabelText = 5
    let viewModel = CancelOrderViewModel()
    var endTime: Date?
    var timer = Timer()
    
    // Buat UI
    
    let cancelButon: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 15, y: 545, width: 359, height: 53)
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont(name: Constant.CancelOrder.fontName, size: 17)
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 15
        
        button.addTarget(self, action: #selector(cancelButtonDidTap), for: .touchUpInside)
        return button
        
    }()
    
    let textLabel: UILabel = {
        
        let label = UILabel(frame: CGRect(x: 57, y: 94, width: 276, height: 72))
        label.numberOfLines = 2
        label.textAlignment = .center
        
        label.font = UIFont(name: Constant.CancelOrder.fontName, size: 20)
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.text = "Cancel to recheck or change your order"
        
        return label
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCircle()
        addTimeLabel()
        timerCountDown()
        view.addSubview(cancelButon)
        view.addSubview(textLabel)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        viewModel.animatedCircle(shapeLayer: bgShapeLayer, timeLeft: timeLeft)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func getCircle() {
        // Path
        let center = CGPoint(x: view.frame.midX, y: view.frame.midY - 110)
        let path = UIBezierPath(arcCenter: center, radius: 120, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
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
        timeLabel = UILabel(frame: CGRect(x: 158, y: 302, width: 100, height: 80))
        
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont(name: Constant.CancelOrder.fontName, size: 80)
        timeLabel.text = String(timeLabelText)
        view.addSubview(timeLabel)
    }
    
    func timerCountDown() {
        
        endTime = Date().addingTimeInterval(timeLeft)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        if timeLeft > 0 {
            timeLabelText -= 1
            timeLabel.text = String(timeLabelText)
            timeLeft = endTime?.timeIntervalSinceNow ?? 0
        } else {
            timeLabel.text = "0"
            timer.invalidate()
        }
        
    }
    
    @objc func cancelButtonDidTap() {
        
        dismiss(animated: true, completion: nil)
    }
}

