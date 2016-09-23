//
//  ViewController.swift
//  SampleGridView
//
//  Created by 一騎高橋 on 2016/09/24.
//  Copyright © 2016年 IkkiTakahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blackView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.drawGridToView(targetView: blackView, numberOfRows: 2, numberOfColumns: 2, lineColor: UIColor.white, lineWidth: 1.0)
    }
    
    func drawGridToView(targetView: UIView, numberOfRows: Int, numberOfColumns: Int, lineColor: UIColor, lineWidth: CGFloat) {

        let columnWidth = targetView.frame.width / CGFloat(numberOfRows + 1)
        let columnHeight = targetView.frame.height / CGFloat(numberOfColumns + 1)
        
        let gridLayer = CAShapeLayer()
        gridLayer.frame = targetView.bounds
        gridLayer.strokeColor = lineColor.cgColor
        gridLayer.lineWidth = lineWidth
        
        let path = CGMutablePath()
        
        for i in 1...numberOfColumns {
            let startPoint = CGPoint(x: targetView.bounds.origin.x, y: columnHeight * CGFloat(i))
            let endPoint   = CGPoint(x: targetView.frame.width, y: columnHeight * CGFloat(i))
            path.move(to: startPoint)
            path.addLine(to: endPoint)
            gridLayer.path = path
        }
        
        for i in 1...numberOfRows {
            let startPoint = CGPoint(x: columnWidth * CGFloat(i), y: targetView.bounds.origin.y)
            let endPoint   = CGPoint(x: columnWidth * CGFloat(i), y: targetView.frame.height)
            path.move(to: startPoint)
            path.addLine(to: endPoint)
            gridLayer.path = path
        }
        
        targetView.layer.addSublayer(gridLayer)
    }
    
}

