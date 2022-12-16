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
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var pieView: PieChartView!
    private var pieChart = PieChartView() // pie graphs
    private let cowViewModel = CowViewModel()
    private var cowArray = [CowModel]()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pieChart.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: Constants.CollectionView.homeCollectionView, bundle: nil), forCellWithReuseIdentifier: Constants.CollectionView.cell)
        cowViewModel.calfToHeifer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //  navigationController?.navigationBar.isHidden = true
        setupPieChart()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addSideMenuButton()
        tabBarController?.tabBar.isHidden = false
        
    }
    
    
    
    // MARK: - Setup
    
    func setupPieChart(){
        pieView.chartDescription.enabled = false
        pieView.drawHoleEnabled = false
        
        pieView.rotationAngle = 0
        // pieView.rotationEnabled = false
//        pieView.isUserInteractionEnabled = false
           pieView.legend.enabled = false
        
        var entries: [PieChartDataEntry] = Array()
        entries.append(PieChartDataEntry(value: Double(cowViewModel.cowStatus(filter: "Gebe")),label: "Gebe \n (\(cowViewModel.cowStatus(filter: "Gebe")))"))
        entries.append(PieChartDataEntry(value: Double(cowViewModel.cowStatus(filter: "Tohumlanmış")),label: "Tohumlanmış \n (\(cowViewModel.cowStatus(filter: "Tohumlanmış")))"))
        entries.append(PieChartDataEntry(value: Double(cowViewModel.cowStatus(filter: "Taze")),label: "0-60 Taze \n (\(cowViewModel.cowStatus(filter: "Taze")))"))
        entries.append(PieChartDataEntry(value: Double(cowViewModel.cowStatus(filter: "Kuruda")),label: "Kuruda \n (\(cowViewModel.cowStatus(filter: "Kuruda")))"))
        entries.append(PieChartDataEntry(value: Double(cowViewModel.cowStatus(filter: "Boş")),label: "Boş \n (\(cowViewModel.cowStatus(filter: "Boş")))"))  // ?
        entries.append(PieChartDataEntry(value: Double(cowViewModel.homeZeroThreeMonths()),label: "0-3 Ay \n (\(cowViewModel.homeZeroThreeMonths()))"))
        entries.append(PieChartDataEntry(value: Double(cowViewModel.homeThreeTwelveMonths()),label: "3-12 Ay \n (\(cowViewModel.homeThreeTwelveMonths()))"))
        entries.append(PieChartDataEntry(value: Double(cowViewModel.cowStatus(filter: "Düve")),label: "Düveler \n (\(cowViewModel.cowStatus(filter: "Düve")))"))
        entries.append(PieChartDataEntry(value: Double(cowViewModel.cowStatus(filter: "Boğa")),label: "Boğa \n (\(cowViewModel.cowStatus(filter: "Boğa")))"))
        
        let dataSet = PieChartDataSet(entries: entries , label: "")
        
        let c1 = NSUIColor(hex: 0x3A015C)
        let c2 = NSUIColor(hex: 0x4F0147)
        let c3 = NSUIColor(hex: 0x35012C)
        let c4 = NSUIColor(hex: 0x290025)
        let c5 = NSUIColor(hex: 0x11001C)
        let c6 = NSUIColor(hex: 0x21001C)
        let c7 = NSUIColor(hex: 0x31001C)
        let c8 = NSUIColor(hex: 0x41001C)
        let c9 = NSUIColor(hex: 0x51001C)
        
        let a1 = NSUIColor(red: 0, green: 16, blue: 217)
        let a2 = NSUIColor(red: 0, green: 32, blue: 255)
        let a3 = NSUIColor(red: 0, green: 64, blue: 255)
        let a4 = NSUIColor(red: 0, green: 96, blue: 255)
        let a5 = NSUIColor(red: 0, green: 128, blue: 255)
        let a6 = NSUIColor(red: 0, green: 159, blue: 255)
        let a7 = NSUIColor(red: 0, green: 191, blue: 255)
        let a8 = NSUIColor(red: 0, green: 0, blue: 255)
        let a9 = NSUIColor(red: 0, green: 0, blue: 179)
        
        
        
//       dataSet.colors = [c1,c2,c3,c4,c5,c6,c7,c8,c9]
        dataSet.colors = [a1,a2,a3,a4,a5,a6,a7,a8,a9]
        dataSet.drawValuesEnabled = false
        
        
        pieView.data = PieChartData(dataSet: dataSet)
    }
    
    
    
    // MARK: - Actions

    
    //MARK: - Methods
    
 

    
}

extension HomeViewController : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.Arrays.collectionViewItemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionView.cell, for: indexPath) as? MenuCollectionViewCell else{return UICollectionViewCell()}
        cell.collectionImage.image = UIImage(named: Constants.Arrays.collectionViewItemArray[indexPath.row])
        cell.collectionLabel.text = Constants.Arrays.collectionViewItemArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width-16.0 * 2
        let height : CGFloat = 234.0
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let viewController = self.getViewController(fromStoryboard: .menu, type: MenuTableViewController.self) else {return}
        
        viewController.filter = Constants.Arrays.collectionViewItemArray[indexPath.row]
        self.navigationController?.show(viewController, sender: nil)
    }
    
    
}

