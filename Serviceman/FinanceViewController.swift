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
    
    private lazy var monthPopUpButton: UIButton = {
        var attributes = AttributeContainer()
        attributes.font = UIFont.boldSystemFont(ofSize: 16)
        
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.attributedTitle = AttributedString("December", attributes: attributes)
        buttonConfiguration.baseForegroundColor = .black
        buttonConfiguration.baseBackgroundColor = UIColor(
            red: 238/255,
            green: 238/255,
            blue: 239/255,
            alpha: 1
        )
        return UIButton(configuration: buttonConfiguration)
    }()
    
    private lazy var profitLabel: UILabel = {
        let label = UILabel()
        label.text = "Profit: "
        return label
    }()
    
    private lazy var numberOfOrdersLabel: UILabel = {
        let label = UILabel()
        label.text = "Number of Orders: "
        return label
    }()
    
    private lazy var averageCost: UILabel = {
        let label = UILabel()
        label.text = "Average Cost: "
        return label
    }()
    
    private lazy var numberOfWorkingDays: UILabel = {
        let label = UILabel()
        label.text = "Number Of Working Days: "
        return label
    }()
    
    private lazy var numberOfFines: UILabel = {
        let label = UILabel()
        label.text = "Number Of Fines: "
        return label
    }()

    private lazy var amountOfFines: UILabel = {
        let label = UILabel()
        label.text = "Amount Of Fines"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setupNavigationBar()
        setMonthPopUpButton()
    }
    
    private func layout() {
        view.addSubview(timePeriodSegmentedControl)
        timePeriodSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        view.addSubview(monthPopUpButton)
        monthPopUpButton.snp.makeConstraints { make in
            make.top.equalTo(timePeriodSegmentedControl.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
        
        view.addSubview(profitLabel)
        profitLabel.snp.makeConstraints { make in
            make.top.equalTo(monthPopUpButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        view.addSubview(numberOfOrdersLabel)
        numberOfOrdersLabel.snp.makeConstraints { make in
            make.top.equalTo(profitLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        view.addSubview(averageCost)
        averageCost.snp.makeConstraints { make in
            make.top.equalTo(numberOfOrdersLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        view.addSubview(numberOfWorkingDays)
        numberOfWorkingDays.snp.makeConstraints { make in
            make.top.equalTo(averageCost.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        view.addSubview(numberOfFines)
        numberOfFines.snp.makeConstraints { make in
            make.top.equalTo(numberOfWorkingDays.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        view.addSubview(amountOfFines)
        amountOfFines.snp.makeConstraints { make in
            make.top.equalTo(numberOfFines.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(30)
        }
        
        
        
    }
    
    private func setMonthPopUpButton() {
//        let optionClosure = {(action: UIAction) in
//
//            )
//        }
         
        monthPopUpButton.menu = UIMenu(children: [
            UIAction(title: "January",state: .on, handler: { action in }),
            UIAction(title: "February", handler: { action in }),
            UIAction(title: "March", handler: { action in }),
            UIAction(title: "April", handler: { action in }),
            UIAction(title: "May", handler: { action in }),
            UIAction(title: "June", handler: { action in }),
            UIAction(title: "July", handler: { action in }),
            UIAction(title: "August", handler: { action in }),
            UIAction(title: "September", handler: { action in }),
            UIAction(title: "October", handler: { action in }),
            UIAction(title: "November", handler: { action in }),
            UIAction(title: "December", handler: { action in }),
        ])
        
        monthPopUpButton.showsMenuAsPrimaryAction = true
        monthPopUpButton.changesSelectionAsPrimaryAction = true
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
}
