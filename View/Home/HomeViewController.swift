//
//  HomeViewController.swift
//  Herd Tracking
//
//  Created by Narkoz on 8.05.2022.
//


import UIKit
import Charts

class HomeViewController: BaseViewController , ChartViewDelegate {
    
    // MARK: - Properties
    @IBOutlet var pieView: PieChartView!
    var pieChart = PieChartView() // pie graphs
  
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pieChart.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      
        setupPieChart()

    }
    
    
    
    // MARK: - Setup
    
    func setupPieChart(){
        pieView.chartDescription.enabled = false
        pieView.drawHoleEnabled = false
        pieView.rotationAngle = 0
        //pieView.rotationEnabled = false
        //pieView.isUserInteractionEnabled = false
        
       // pieView.legend.enabled = false
        
        var entries: [PieChartDataEntry] = Array()
        entries.append(PieChartDataEntry(value: 50.0,label: "Gebe"))
        entries.append(PieChartDataEntry(value: 40.0,label: "Tohumlanmış"))
        entries.append(PieChartDataEntry(value: 10.0,label: "0-60 Taze"))
        entries.append(PieChartDataEntry(value: 20.0,label: "Kuruda"))
        entries.append(PieChartDataEntry(value: 70.0,label: "Gebelik Kontrol"))
        entries.append(PieChartDataEntry(value: 30.0,label: "0-3 aylık"))
        entries.append(PieChartDataEntry(value: 20.0,label: "3-12 aylık"))
        entries.append(PieChartDataEntry(value: 20.0,label: "Düveler"))
        entries.append(PieChartDataEntry(value: 80.0,label: "Erkekler"))
        
        let dataSet = PieChartDataSet(entries: entries , label: "")
       
        let c1 = NSUIColor(hex: 0x3A015C)
        let c2 = NSUIColor(hex: 0x4F0147)
        let c3 = NSUIColor(hex: 0x35012C)
        let c4 = NSUIColor(hex: 0x290025)
        let c5 = NSUIColor(hex: 0x11001C)
        
        dataSet.colors = [c1,c2,c3,c4,c5]
        dataSet.drawValuesEnabled = false
        
        pieView.data = PieChartData(dataSet: dataSet)
    }
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
}


