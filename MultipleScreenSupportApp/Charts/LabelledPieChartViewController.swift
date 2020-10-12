//
//  LabelledPieChartViewController.swift
//  MultipleScreenSupportApp
//
//  Created by Developer Admin on 15/07/20.
//  Copyright © 2020 Developer Admin. All rights reserved.
//

import Charts
import PieCharts
import UIKit

class LabelledPieChartViewController: UIViewController {
    
    @IBOutlet weak var pieView: PieChartView! {
        didSet {
            pieView.drawHoleEnabled = true
            pieView.chartDescription?.text = ""
        }
    }
    
    
    
//    let pieView : PieChartView = {
//    let set = PieChartView()
//    set.translatesAutoresizingMaskIntoConstraints = false
//    set.drawHoleEnabled = true
//    set.chartDescription?.text = ""
//    return set
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "Pie"
        //setChart()
        chartData()
    }
    
    let surveyData = ["cat": 20, "dog": 30, "both": 5, "neither": 45]

    func setChart(){
        //view.addSubview(pieView)
//        pieView.centerXAnchor.constraint(equalTo:    view.centerXAnchor).isActive = true
//        pieView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        pieView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
//        pieView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true

    }

    func chartData(){
        var data = [PieChartDataEntry]()
        for (key,value) in surveyData{
            print(key)
            print(value)
            let entry = PieChartDataEntry(value: Double(value), label: key)
            data.append(entry)
        }
        let chart = PieChartDataSet(entries: data, label: "data")
        chart.colors = ChartColorTemplates.material()
        chart.sliceSpace = 2
        chart.selectionShift = 0
        chart.xValuePosition = .outsideSlice
        chart.yValuePosition = .outsideSlice
        chart.valueTextColor = .red
        chart.valueLineWidth = 0.5
        chart.valueLinePart1Length = 0.2
        chart.valueLinePart2Length = 4
        chart.drawValuesEnabled = true
        let chartData = PieChartData(dataSet: chart)
        pieView.data = chartData
     }
    
    
    

}
