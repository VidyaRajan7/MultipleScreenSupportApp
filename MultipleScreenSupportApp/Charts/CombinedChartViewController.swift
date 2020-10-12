//
//  CombinedcombinedChartController.swift
//  MultipleScreenSupportApp
//
//  Created by Developer Admin on 13/07/20.
//  Copyright © 2020 Developer Admin. All rights reserved.
//

import UIKit
import Charts

class CombinedChartViewController: UIViewController {

    @IBOutlet weak var combinedChart: CombinedChartView!
    
    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    //let months = ["Jan", "Feb"]
    let ITEM_COUNT  = 5

    override func viewDidLoad() {
        super.viewDidLoad()

        combinedChart.animate(xAxisDuration: 1.0, yAxisDuration: 1.0)
        setChart()
    }
    
    func setChart() {
        combinedChart.delegate                  = self
        combinedChart.drawGridBackgroundEnabled = false
        combinedChart.drawBarShadowEnabled      = false
        combinedChart.highlightFullBarEnabled   = true
        //combinedChart.drawOrder                 = [DrawOrder.bar.rawValue,DrawOrder.bubble.rawValue, DrawOrder.candle.rawValue, DrawOrder.line.rawValue, DrawOrder.scatter.rawValue]
        
        combinedChart.drawOrder                 = [DrawOrder.bar.rawValue, DrawOrder.line.rawValue]
        
        // MARK: xAxis
        let xAxis                          = combinedChart.xAxis
        xAxis.labelPosition                 = .bothSided
        xAxis.axisMinimum                   = 0.0
        xAxis.granularity                   = 1.0
        xAxis.valueFormatter                = BarChartFormatter()
        
        xAxis.centerAxisLabelsEnabled = true
       
        xAxis.setLabelCount( ITEM_COUNT, force: true)
        
        
        // MARK: leftAxis
        let leftAxis                        = combinedChart.leftAxis
        leftAxis.drawGridLinesEnabled       = true
        leftAxis.axisMinimum                = 0.0
        
        //leftAxis.nameAxis = "left Axis"
        //leftAxis.nameAxisEnabled = true

        // MARK: rightAxis
        let rightAxis                       = combinedChart.rightAxis
        rightAxis.drawGridLinesEnabled      = false
        rightAxis.axisMinimum               = 0.0
        
        //rightAxis.nameAxis = "right Axis"
        //rightAxis.nameAxisEnabled = true
    
        // MARK: legend
        let legend                          = combinedChart.legend
        legend.wordWrapEnabled              = true
        legend.horizontalAlignment          = .center
        legend.verticalAlignment            = .bottom
        legend.orientation                  = .horizontal
        legend.drawInside                   = false
        
        // MARK: description
        combinedChart.chartDescription?.enabled = false
        
        setChartData()
    }
    
    func setChartData()
    {
        let data = CombinedChartData()
        data.lineData = generateLineData()
        data.barData = generateBarData()
        //data.bubbleData = generateBubbleData()
        //data.scatterData = generateScatterData()
       // data.candleData = generateCandleData()
        //combinedChart.xAxis.axisMaximum = data.xMax + 0.25
        
        combinedChart.xAxis.axisMaximum = data.xMax + 0.37
        combinedChart.data = data
    }
    
    func generateLineData() -> LineChartData
    {
        // MARK: ChartDataEntry
        var entries = [ChartDataEntry]()
        
//        entries.append(ChartDataEntry(x: 0, y: 88))
//        entries.append(ChartDataEntry(x: 1, y: 100))
//        entries.append(ChartDataEntry(x: 2, y: 100))
//        entries.append(ChartDataEntry(x: 3, y: 100))
        
        for index in 0..<ITEM_COUNT
        {
            entries.append(ChartDataEntry(x: Double(index) + 0.5, y: (Double(arc4random_uniform(15) + 5))))
        }
        
        // MARK: LineChartDataSet
        let set = LineChartDataSet(entries: entries, label: "Line DataSet")
        set.colors = [#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)]
        set.lineWidth = 2.5
        set.circleColors = [#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)]
        set.circleHoleRadius = 2.5
        set.fillColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        set.mode = .cubicBezier
        set.drawValuesEnabled = true
        set.valueFont = NSUIFont.systemFont(ofSize: CGFloat(14.0))
        set.valueTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        set.axisDependency = .left
        set.circleRadius = 0
        
        entries = [ChartDataEntry]()
        entries.append(ChartDataEntry(x: 0, y: 27))
        entries.append(ChartDataEntry(x: 1, y: 18))
        entries.append(ChartDataEntry(x: 2, y: 31))
        entries.append(ChartDataEntry(x: 3, y: 21))
//        let set2 = LineChartDataSet(entries: entries, label: "Line DataSet")
//        set2.colors = [#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)]
//        set2.lineWidth = 2.5
//        set2.circleColors = [#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)]
//        set2.circleHoleRadius = 2.5
//        set2.fillColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
//        set2.mode = .cubicBezier
//        set2.drawValuesEnabled = true
//        set2.valueFont = NSUIFont.systemFont(ofSize: CGFloat(14.0))
//        set2.valueTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        set2.axisDependency = .left
//        set2.circleRadius = 0
        
        // MARK: LineChartData
        let data = LineChartData()
        data.addDataSet(set)
       // data.addDataSet(set2)
        return data
    }
    
    func generateBarData() -> BarChartData
    {
        // MARK: BarChartDataEntry
        var entries1 = [BarChartDataEntry]()
        var entries2 = [BarChartDataEntry]()
        var entries3 = [BarChartDataEntry]()
//        entries1.append(BarChartDataEntry(x: 0.0, y: 160.0))
//        entries2.append(BarChartDataEntry(x: 0.0, y: 60.0))
//        entries3.append(BarChartDataEntry(x: 0.0, y: 80.0))
//
//        entries1.append(BarChartDataEntry(x: 0.0, y: 195.0))
//        entries2.append(BarChartDataEntry(x: 0.0, y: 70.0))
//        entries3.append(BarChartDataEntry(x: 0.0, y: 145.0))
        
        
        for _ in 0..<ITEM_COUNT
        {
            entries1.append(BarChartDataEntry(x: 0.0, y: (Double(arc4random_uniform(25) + 25))))
            // stacked
            entries2.append(BarChartDataEntry(x: 0.0, yValues: [Double(arc4random_uniform(13) + 12), Double(arc4random_uniform(13) + 12)]))

            entries3.append(BarChartDataEntry(x: 0.0, yValues: [Double(arc4random_uniform(28) + 28)]))
        }
        
        // MARK: BarChartDataSet
        let set1            = BarChartDataSet(entries: entries1, label: "Bar 1")
        set1.colors         = [#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)]
        set1.valueTextColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        set1.valueFont      = NSUIFont.systemFont(ofSize: CGFloat(10.0))
        set1.axisDependency = .left
        
        let set2            = BarChartDataSet(entries: entries2, label: "Bar 2")
        set2.stackLabels    = ["Stack 1", "Stack 2"]
        set2.colors         = [#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1),  #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)]
        set2.valueTextColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        set2.valueFont      = NSUIFont.systemFont(ofSize: CGFloat(10.0))
        set2.axisDependency = .left
        
        let set3           = BarChartDataSet(entries: entries3, label: "Bar 3")
        set3.colors         = [#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)]
        set3.valueTextColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        set3.valueFont      = NSUIFont.systemFont(ofSize: CGFloat(10.0))
        set3.axisDependency = .left
        
        // MARK: BarChartData
//        let groupSpace = 0.06
        let groupSpace = calcGroupSpace(n: 3)
        let barSpace = 0.00
        //let barWidth = 0.46
        let barWidth = groupSpace
        
        
        
        
        //new
        
        
        
        
        // x2 dataset
        // (0.45 + 0.02) * 2 + 0.06 = 1.00 -> interval per "group"
        let data = BarChartData(dataSets: [set1, set2, set3])
        data.barWidth = barWidth
        // make this BarData object grouped
        data.groupBars(fromX: 0.0, groupSpace: groupSpace, barSpace: barSpace)     // start at x = 0
        return data
    }
    
    func calcGroupSpace(n:Int)->Double {
        let groupSpace = 1 - (0.23 * Double(3))
        return groupSpace
        
    }
    
    func generateScatterData() -> ScatterChartData
    {
        // MARK: ChartDataEntry
        var entries = [ChartDataEntry]()
        var index = 0.0
        while index < Double(ITEM_COUNT)
        {
            entries.append(ChartDataEntry(x: index + 0.25, y: (Double(arc4random_uniform(10) + 55))))
            index += 0.5
        }
        
        // MARK: ScatterChartDataSet
        let set = ScatterChartDataSet(entries: entries, label: "Scatter DataSet")
        set.colors = ChartColorTemplates.material()
        set.scatterShapeSize = 4.5
        set.drawValuesEnabled = false
        set.valueFont = NSUIFont.systemFont(ofSize: CGFloat(10.0))
        
        
        // MARK: ScatterChartData
        let data = ScatterChartData()
        data.addDataSet(set)
        return data
    }
    
    func generateCandleData() -> CandleChartData
    {
        // MARK: CandleChartDataEntry
        var entries = [CandleChartDataEntry]()
        var index = 0
        while index < ITEM_COUNT {
            entries.append(CandleChartDataEntry(x: Double(index + 1), shadowH: 90.0, shadowL: 70.0, open: 85.0, close: 75.0))
            index += 2
        }
        
        // MARK: CandleChartDataSet
        let set = CandleChartDataSet(entries: entries, label: "Candle DataSet")
        set.colors = [#colorLiteral(red: 0.313725490196078, green: 0.313725490196078, blue: 0.313725490196078, alpha: 1.0)]
        
        set.decreasingColor = #colorLiteral(red: 0.556862745098039, green: 0.588235294117647, blue: 0.686274509803922, alpha: 1.0)
        //set.shadowColor = NSColor.darkGray
        set.valueFont = NSUIFont.systemFont(ofSize: CGFloat(10.0))
        set.drawValuesEnabled = false
        
        // MARK: CandleChartData
        let data = CandleChartData()
        data.addDataSet(set)
        return data
    }
    
    func generateBubbleData() -> BubbleChartData
    {
        // MARK: BubbleChartDataEntry
        var entries = [BubbleChartDataEntry]()
        for index in 0..<ITEM_COUNT
        {
            let y = Double(arc4random_uniform(10)) + 105.0
            let size = Double(arc4random_uniform(50)) + 105.0
            entries.append(BubbleChartDataEntry(x: Double(index) + 0.5, y: y, size: CGFloat(size)))
        }
        
        // MARK: BubbleChartDataSet
        let set = BubbleChartDataSet(entries: entries, label: "Bubble DataSet")
        set.colors = ChartColorTemplates.vordiplom()
        set.valueTextColor = NSUIColor.white
        set.valueFont = NSUIFont.systemFont(ofSize: CGFloat(10.0))
        set.drawValuesEnabled = true
        set.normalizeSizeEnabled  = true
        
        // MARK: BubbleChartData
        let data = BubbleChartData()
        data.addDataSet(set)
        return data
    }


}

extension CombinedChartViewController: ChartViewDelegate
{
    public func chartValueSelected(_ combinedChart: ChartViewBase, entry: ChartDataEntry, highlight: Highlight)
    {
//       combinedChart.highlightValue(x: 0, dataSetIndex: 1)
        print("chartValueSelected : x = \(highlight.x)")
    }
    
    public func chartValueNothingSelected(_ combinedChart: ChartViewBase)
    {
        print("chartValueNothingSelected")
    }
    
    public class BarChartFormatter: NSObject, IAxisValueFormatter
    {
        var months: [String]! = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        //var months: [String]! = ["Jan", "Feb"]
        
        public func stringForValue(_ value: Double, axis: AxisBase?) -> String
        {
            let modu =  Double(value).truncatingRemainder(dividingBy: Double(months.count))
            print(months[Int(modu)])
            return months[ Int(modu) ]
        }
    }
}









