//
//  ViewController.swift
//  fanShapeWithPercent
//
//  Created by Tyobigoro on 2018/05/25.
//  Copyright © 2018年 Tyobigoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroungView: UIView!
    @IBOutlet weak var fanShapedView: UIView!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var percentValueLabel: UILabel!
    
    var fanShapedLineWithPercentView: UIImageView?
    var percentValue: Double = 50.0
    
    func addFanShapedView(){
        let fanShapedLineWithPercentLine = DrawFSLineWithPercent()
        fanShapedLineWithPercentView = fanShapedLineWithPercentLine.drawLine(
            view: fanShapedView,
            linewidth: 25,
            lineColor: UIColor.blue,
            radius: 60,
            percent: percentValue
        )
        view.addSubview(fanShapedLineWithPercentView!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        percentValueLabel.text = String(percentValue) + "%"
        addFanShapedView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func percentValueChange(_ sender: UISlider) {
        percentValue = round(Double(sender.value))
        percentValueLabel.text = String(percentValue) + "%"
        fanShapedLineWithPercentView?.removeFromSuperview()
        addFanShapedView()
    }
    
    // レイアウト・制約の変更
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let ASViewCenter: CGPoint = view.convert(percentValueLabel.center, from: backgroungView)
        fanShapedLineWithPercentView?.center = ASViewCenter
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

