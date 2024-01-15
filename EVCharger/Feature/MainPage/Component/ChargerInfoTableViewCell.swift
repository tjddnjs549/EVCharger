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
    private lazy var nameLabel = UILabel().then {
        $0.labelMakeUI(textColor: ColorGuide.blue.withAlphaComponent(0.8), font: FontGuide.size24Bold, textAligment: .left)
    }
    
    private lazy var addressLabel = UILabel().then {
        $0.labelMakeUI(textColor: ColorGuide.black, font: FontGuide.size19, textAligment: .left)
    }
    
    private let rapidLabel = UILabel().then {
        $0.text = "rapid: "
        $0.labelMakeUI(textColor: ColorGuide.black, font: FontGuide.size16Bold, textAligment: .left)
    }
    
    private lazy var rapidCntLabel = UILabel().then {
        $0.labelMakeUI(textColor: ColorGuide.black, font: FontGuide.size16, textAligment: .left)
    }
    
    private lazy var rapidStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [rapidLabel, rapidCntLabel])
        stack.spacing = 4
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        return stack
    }()
    
    private let dividerView = UIView().then {
        $0.backgroundColor = ColorGuide.black
    }
    
    private let slowLabel = UILabel().then {
        $0.text = "slow: "
        $0.labelMakeUI(textColor: ColorGuide.black, font: FontGuide.size16Bold, textAligment: .left)
    }
    
    private lazy var slowCntLabel = UILabel().then {
        $0.labelMakeUI(textColor: ColorGuide.black, font: FontGuide.size16, textAligment: .left)
    }
    
    private lazy var slowStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [slowLabel, slowCntLabel])
        stack.spacing = 4
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        return stack
    }()
    
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
        nameLabel.text = "loading..."
        addressLabel.text = "loading..."
        rapidCntLabel.text = "0"
        slowCntLabel.text = "0"
    }
}


// MARK: - private extension func

private extension ChargerInfoTableViewCell {
    
    func cellMakeUI() {
        
        [nameLabel, addressLabel, rapidStackView, dividerView, slowStackView].forEach {
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
            make.bottom.equalTo(rapidStackView.snp.top).offset(-10)
        }
        
        rapidStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalTo(dividerView.snp.leading).offset(-10)
            make.bottom.equalToSuperview().inset(10)
            make.width.equalTo(100)
        }
        
        dividerView.snp.makeConstraints { make in
            make.centerY.equalTo(rapidStackView.snp.centerY).inset(0)
            make.height.equalTo(rapidStackView.snp.height)
            make.width.equalTo(2)
        }
        
        slowStackView.snp.makeConstraints { make in
            make.leading.equalTo(dividerView.snp.leading).offset(10)
            make.centerY.equalTo(rapidStackView.snp.centerY)
            make.width.equalTo(110)
        }
    }
}


// MARK: - extension func


extension ChargerInfoTableViewCell {
    
    func dataBinding(name: String, address: String, rapid: Int, slow: Int) {
        self.nameLabel.text = name
        self.addressLabel.text = address
        self.rapidCntLabel.text = String(rapid)
        self.slowCntLabel.text = String(slow)
    }
}
