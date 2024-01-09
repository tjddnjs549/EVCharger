//
//  ViewController.swift
//  EVCharger
//
//  Created by 박성원 on 1/9/24.
//

import UIKit
import SnapKit
import Then

final class MainPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
    // MARK: - properties
    private let infoTableView = UITableView()
    
    
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    
}




// MARK: - extension custom func
private extension MainPageViewController {
    
    func tableviewSetting() {
        infoTableView.delegate = self
        infoTableView.dataSource = self
        //self.register(MyPageTableViewCell.self, forCellReuseIdentifier: "")
    }
}





// MARK: - @objc func
extension MainPageViewController {
    
    
}
