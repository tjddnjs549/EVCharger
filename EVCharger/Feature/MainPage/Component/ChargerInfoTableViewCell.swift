//
//  ChargerInfoTableViewCell.swift
//  EVCharger
//
//  Created by 박성원 on 1/10/24.
//

import UIKit
import SnapKit
import Then

final class ChargerInfoTableViewCell: UITableViewCell {

    static let identifier = "ChargerInfoTableViewCell"
    
    // MARK: - CellUIProperties
    private let nameLabel = UILabel().then {
        $0.labelMakeUI(textColor: ColorGuide.blue, font: FontGuide.size16Bold, textAligment: .left)
    }
    
    private let addressLabel = UILabel().then {
        $0.labelMakeUI(textColor: ColorGuide.black, font: FontGuide.size14, textAligment: .left)
    }
    
//    private let pinLabel = UILabel().then {
//        $0.labelMakeUI(textColor: ColorGuide.black, font: FontGuide.size14, textAligment: .left)
//    }
//    
//    private let levelLabel = UILabel().then {
//        $0.labelMakeUI(textColor: ColorGuide.black, font: FontGuide.size14, textAligment: .left)
//    }
    
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        cellMakeUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}


// MARK: - extension

private extension ChargerInfoTableViewCell {
    
    func cellMakeUI() {
        
        [nameLabel, addressLabel].forEach {
            self.contentView.addSubview($0)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(4)
            make.trailing.equalToSuperview().inset(10)
        }
        
        addressLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
