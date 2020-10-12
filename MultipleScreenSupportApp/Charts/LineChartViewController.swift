//
//  LineChartViewController.swift
//  MultipleScreenSupportApp
//
//  Created by Developer Admin on 09/07/20.
//  Copyright © 2020 Developer Admin. All rights reserved.
//
import Charts
import SwiftChart
import UIKit

class LineChartViewController: UIViewController, ChartDelegate  {
    
    
    
    @IBOutlet weak var swiftLineChart: Chart!
    var selectedChart = 0
    let players = ["Ozil", "Ramsey", "Laca", "Auba", "Xhaka", "Torreira"]
    let goals = [6, 8, 26, 30, 8, 10]

    @IBOutlet weak var lineChartView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swiftLineChart.delegate = self
        basicLineChartSetUp()
    
        customizeChart(dataPoints: players, values: goals.map{ Double($0) })
    }
    
    func basicLineChartSetUp() {
        let data = [
          (x: Double(0), y: 0),
          (x: 3, y: 2.5),
          (x: 4, y: 2),
          (x: 5, y: 2.3),
          (x: 7, y: 3),
          (x: 8, y: 2.2),
          (x: 9, y: 2.5)
        ]
        let series = ChartSeries(data: data)
        series.area = true
        swiftLineChart.xLabels = [0, 3, 6, 9, 12, 15, 18, 21, 24]
        swiftLineChart.xLabelsFormatter = { String(Int(round($1))) + "h" }
        swiftLineChart.add(series)
    }
    
    func customizeChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
          let dataEntry = ChartDataEntry(x: values[i], y: Double(i))
          dataEntries.append(dataEntry)
        }
        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: nil)
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartView.data = lineChartData
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   
    func didTouchChart(_ chart: Chart, indexes: [Int?], x: Float, left: CGFloat) {
        for (seriesIndex, dataIndex) in indexes.enumerated() {
            if let value = chart.valueForSeries(seriesIndex, atIndex: dataIndex) {
                print("Touched series: \(seriesIndex): data index: \(dataIndex!); series value: \(value); x-axis value: \(x) (from left: \(left))")
            }
        }
    }
    
    func didFinishTouchingChart(_ chart: Chart) {
        
    }
    
    func didEndTouchingChart(_ chart: Chart) {
        
    }
    
    @IBAction func didTapBasicChart(_ sender: UIButton) {
        swiftLineChart.removeAllSeries()
        basicLineChartSetUp()
    }
    @IBAction func didTapMultipleOrPartiallyFilled(_ sender: UIButton) {
        swiftLineChart.removeAllSeries()
       // let data = [0, -2, -2, 3, -3, 4, 1, 0, -1]
        
        let series1 = ChartSeries([0, 6, 2, 8, 4, 7, 3, 10, 8])
                   series1.color = ChartColors.yellowColor()
                   series1.area = true
                   
                   let series2 = ChartSeries([1, 0, 0.5, 0.2, 0, 1, 0.8, 0.3, 1])
                   series2.color = ChartColors.redColor()
                   series2.area = true
                   
                   // A partially filled series
                   let series3 = ChartSeries([9, 8, 10, 8.5, 9.5, 10])
                   series3.color = ChartColors.purpleColor()
                   
                   swiftLineChart.add([series1, series2, series3])
    }
    @IBAction func didTapColorFilledAboveAndBelowZero(_ sender: UIButton) {
        swiftLineChart.removeAllSeries()
        //let data: [Double] = [0, -2, -2, 3, -3, 4, 1, 0, -1]
        
        let series = ChartSeries([0, -2, -2, 3, -3, 4, 1, 0, -1])
        series.colors = (
          above: ChartColors.greenColor(),
          below: ChartColors.yellowColor(),
          zeroLevel: -1
        )
        series.area = true
        
        swiftLineChart.add(series)
        
        // Set minimum and maximum values for y-axis
        swiftLineChart.minY = -7
        swiftLineChart.maxY = 7
        
        // Format y-axis, e.g. with units
        swiftLineChart.yLabelsFormatter = { String(Int($1)) +  "ºC" }
    }
    @IBAction func didTapXandYaxis(_ sender: UIButton) {
        swiftLineChart.removeAllSeries()
        let data = [(x: 0, y: 0), (x: 0.5, y: 3.1), (x: 1.2, y: 2), (x: 2.1, y: -4.2), (x: 2.6, y: 1.1)]
        let series = ChartSeries(data: data)
        swiftLineChart.add(series)
    }
    @IBAction func didTapStockChart(_ sender: UIButton) {
        swiftLineChart.removeAllSeries()
    }
    
    
    

}

class BarChartViewController: UIViewController {
    
    @IBOutlet weak var barChartView: BarChartView!
    let players = ["Ozil", "Ramsey", "Laca", "Auba", "Xhaka", "Torreira"]
    let goals = [6, 8, 26, 30, 8, 10]

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeChart(dataPoints: players, values: goals.map{ Double($0) })
    }
    
    func customizeChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
          let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
          dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Bar Chart View")
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
    }
}
