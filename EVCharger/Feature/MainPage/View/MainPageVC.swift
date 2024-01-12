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
    var searchResultData: [ChargerInfo] = []
    
    // MARK: - UIComponents
    
    private lazy var infoTableView = UITableView().then {
        $0.backgroundColor = ColorGuide.white
        $0.separatorColor = ColorGuide.black.withAlphaComponent(0.6)
    }
    
    private lazy var searchController = UISearchController().then {
        $0.searchBar.placeholder = "이름 혹은 주소를 입력해주세요"
        $0.obscuresBackgroundDuringPresentation = false
        $0.hidesNavigationBarDuringPresentation = false
        $0.searchBar.autocapitalizationType = .none
    }
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLoadSetting()
    }
}


// MARK: - extension custom func
private extension MainPageViewController {
    
    func viewDidLoadSetting() {
        tableviewSetting()
        viewMakeUI()
        networking()
        naviBarSetting()
        searchBarSetting()
    }
    
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
            make.top.leading.trailing.bottom.equalToSuperview().inset(0)
        }
    }
    
    
    func naviBarSetting() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .clear
        appearance.shadowColor = .none
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.tintColor = ColorGuide.blue.withAlphaComponent(0.8)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func searchBarSetting() {
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.largeTitleDisplayMode = .always
    }
    
    
    func networking() {
        NetworkManager.shared.fetchVideo(completion: { result in
            switch result {
            case .success(let data):
                self.data = data
                DispatchQueue.main.async {
                    self.infoTableView.reloadData()
                }
            case .failure:
                print("테스트 - ERROR")
            }
        })
    }
    
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}


// MARK: - @objc func
extension MainPageViewController {
    
    
}


// MARK: - UITableViewDataSource


extension MainPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return isFiltering() ? self.searchResultData.count : self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ChargerInfoTableViewCell.identifier, for: indexPath) as! ChargerInfoTableViewCell
        
        if isFiltering() {
            cell.dataBinding(
                name: self.searchResultData[indexPath.row].placeName,
                address: self.searchResultData[indexPath.row].address,
                rapid: String(self.searchResultData[indexPath.row].rapid),
                slow: String(self.searchResultData[indexPath.row].slow)
            )
        } else {
            cell.dataBinding(
                name: self.data[indexPath.row].placeName,
                address: self.data[indexPath.row].address,
                rapid: String(self.data[indexPath.row].rapid),
                slow: String(self.data[indexPath.row].slow)
            )
        }
        cell.selectionStyle = .none
        return cell
    }
}


// MARK: - UITableViewDelegate


extension MainPageViewController: UITableViewDelegate {
    
    
}


// MARK: - UITableViewDelegate


extension MainPageViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print(searchText) // 글자를 입력할 때마다 보여줌
        self.searchResultData = self.data.filter {
            $0.address.contains(searchText) ||  $0.placeName.contains(searchText)
        }
        DispatchQueue.main.async {
            self.infoTableView.reloadData()
        }
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        DispatchQueue.main.async {
            self.isEditing = false
            self.infoTableView.reloadData()
        }
    }
}
