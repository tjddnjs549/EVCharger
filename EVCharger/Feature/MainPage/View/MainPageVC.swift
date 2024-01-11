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
    var data: [ChargerInfo] = []
    
    // MARK: - UIComponents

    private let infoTableView = UITableView().then {
        $0.backgroundColor = ColorGuide.white
        $0.isScrollEnabled = true
        $0.showsVerticalScrollIndicator = true
        $0.separatorStyle = .singleLine
    }
    
    
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        tableviewSetting()
        viewMakeUI()
        NetworkManager.shared.fetchVideo(completion: { result in
            switch result {
            case .success(let data):
                self.data = data
                print("테스트 - \(self.data)")
                self.infoTableView.reloadData()
            case .failure:
                print("테스트 - ERROR")
            }
        })
        
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
        
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ChargerInfoTableViewCell.identifier, for: indexPath) as! ChargerInfoTableViewCell
        
        cell.nameLabel.text = self.data[indexPath.row].placeName
        return cell
    }
}


// MARK: - UITableViewDelegate


extension MainPageViewController: UITableViewDelegate {
    
    
}

