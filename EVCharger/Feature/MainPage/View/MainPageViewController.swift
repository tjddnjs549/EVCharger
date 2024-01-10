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
        infoTableView.register(ChargerInfoTableViewCell.self, forCellReuseIdentifier: ChargerInfoTableViewCell.identifier)
    }
}





// MARK: - @objc func
extension MainPageViewController {
    
    
}


// MARK: - UITableViewDataSource


extension MainPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ChargerInfoTableViewCell.identifier, for: indexPath) as! ChargerInfoTableViewCell
        
        return cell
    }
}




// MARK: - UITableViewDelegate


extension MainPageViewController: UITableViewDelegate {
    
    
}

