//
//  Extension_UILabel.swift
//  EVCharger
//
//  Created by 박성원 on 1/9/24.
//

import UIKit

public extension UILabel {
    func labelMakeUI(textColor: UIColor, font: UIFont, textAligment: NSTextAlignment) {
        self.textColor = textColor
        self.font = font
        self.sizeToFit()
        self.numberOfLines = 2
        self.textAlignment = textAligment
        self.lineBreakMode = .byTruncatingTail // 마지막 라인의 뒷 부분을 잘라내 말 줄임표 (...) 표시
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
