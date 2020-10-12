//
//  PieChartSecondViewController.swift
//  MultipleScreenSupportApp
//
//  Created by Developer Admin on 15/07/20.
//  Copyright © 2020 Developer Admin. All rights reserved.
//

import PieCharts
import UIKit

class PieChartSecondViewController: UIViewController, PieChartDelegate {
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var pHeight: NSLayoutConstraint!
    
    @IBOutlet weak var pWidth: NSLayoutConstraint!
    @IBOutlet weak var pieChartView: PieChart!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pieChartSetup()
       // pieChartView.alignmentRectInsets = UIEdgeInsets(top: <#T##CGFloat#>, left: <#T##CGFloat#>, bottom: <#T##CGFloat#>, right: <#T##CGFloat#>)
        pHeight.constant = 60
        pWidth.constant = 60
    }
    
    func pieChartSetup() {
        pieChartView.models = [
            PieSliceModel(value: 2.1, color: UIColor.yellow),
            PieSliceModel(value: 3, color: UIColor.blue),
            PieSliceModel(value: 1, color: UIColor.green)
        ]
        pieChartView.innerRadius = 30
        pieChartView.outerRadius = 26
        pieChartView.layers = [PiePlainTextLayer(), PieLineTextLayer()]
        
        let textLayerSettings = PiePlainTextLayerSettings()
        textLayerSettings.viewRadius = 55
        textLayerSettings.hideOnOverflow = true
        textLayerSettings.label.font = UIFont.systemFont(ofSize: 8)

        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        textLayerSettings.label.textGenerator = {slice in
            return formatter.string(from: slice.data.percentage * 100 as NSNumber).map{"\($0)%"} ?? ""
        }

        let textLayer = PiePlainTextLayer()
        //textLayer.animator = AlphaPieViewLayerAnimator
        textLayer.settings = textLayerSettings
    }
    
    func onSelected(slice: PieSlice, selected: Bool) {
        
    }

   

}
