//
//  FinanceViewController.swift
//  Serviceman
//
//  Created by Aleksandr on 14.11.2022.
//

import UIKit
import SnapKit

class FinanceViewController: UIViewController {
    
    let items = ["Day", "Month", "Year"]
    
    private lazy var timePeriodSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)
        return segmentedControl
    }()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setupNavigationBar()
    }
    
    private func layout() {
        view.addSubview(timePeriodSegmentedControl)
        timePeriodSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
    }
    
    private func setupNavigationBar() {
        title = "Financial Statistics"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chart.line.uptrend.xyaxis.circle"),
            style: .plain,
            target: self,
            action: #selector(chartButtonPressed)
        )
        navigationController?.navigationBar.tintColor = .black
    }
    
    @objc private func chartButtonPressed() {
        let chartVC = ChartViewController()
        navigationController?.pushViewController(chartVC, animated: true)
    }
    
    @objc private func segmentedControlChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            break
        case 1:
            break
        default:
            break
        }
    }
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
