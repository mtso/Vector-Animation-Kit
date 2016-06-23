//
//  ViewController.swift
//  DrawSVG
//
//  Created by Matthew Tso on 4/27/16.
//  Copyright © 2016 De Anza. All rights reserved.
//

import UIKit
import PocketSVGFramework

class ViewController: UIViewController {

    var pathLayer: CAShapeLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let CGPath = PocketSVG.pathFromSVGFileNamed("line_scape").takeUnretainedValue()
        let UIBezPath = UIBezierPath(CGPath: CGPath)

        pathLayer = CAShapeLayer()
        pathLayer.path = UIBezPath.CGPath

        pathLayer.fillColor = nil
        pathLayer.strokeColor = UIColor.black().cgColor
        pathLayer.lineWidth = 5
                
        view.layer.addSublayer(pathLayer)
        view.layer.setNeedsDisplay()
        
        pathLayer.strokeEnd = 254 / 1000
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func beginAnimation(_ sender: AnyObject) {
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 1
        pathAnimation.fromValue = 0
        pathAnimation.toValue = 1
        pathAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        pathLayer.add(pathAnimation, forKey: "strokeAnimation")
    }
    
    /*
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        <#code#>
    }
    */

}

