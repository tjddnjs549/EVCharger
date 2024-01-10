//
//  ViewController.swift
//  EVCharger
//
//  Created by 박성원 on 1/9/24.
//

import UIKit
import SnapKit
import Then

final class MainPageViewController: UIViewController {
   
    
    // MARK: - properties
    
    public var viewModel: MainViewModel = MainViewModel()
    
    
    // MARK: - UIComponents

    private let infoTableView = UITableView().then {
        $0.backgroundColor = ColorGuide.white
        $0.isScrollEnabled = true
    }
    
    
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        tableviewSetting()
        viewMakeUI()
    }
    
    
}


// MARK: - extension custom func
private extension MainPageViewController {
    
    func tableviewSetting() {
        infoTableView.delegate = self
        infoTableView.dataSource = self
        infoTableView.estimatedRowHeight = UITableView.automaticDimension
        infoTableView.rowHeight = UITableView.automaticDimension
        infoTableView.register(ChargerInfoTableViewCell.self, forCellReuseIdentifier: ChargerInfoTableViewCell.identifier)
    }
    
    func viewMakeUI() {
        view.addSubviews(infoTableView)
        
        infoTableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(10)
        }
    }
}


// MARK: - @objc func
extension MainPageViewController {
    
    
}


// MARK: - UITableViewDataSource


extension MainPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ChargerInfoTableViewCell.identifier, for: indexPath) as! ChargerInfoTableViewCell
        
        return cell
    }
}


// MARK: - UITableViewDelegate


extension MainPageViewController: UITableViewDelegate {
    
    
}

