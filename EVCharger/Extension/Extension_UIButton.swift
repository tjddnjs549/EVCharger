//
//  Extension_UIButton.swift
//  EVCharger
//
//  Created by 박성원 on 1/9/24.
//

import UIKit


public extension UIButton {
    
    //텍스트 버튼
    func buttonMakeUI(backgroundColor: UIColor,cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: CGColor, setTitle: String, font: UIFont, setTitleColor:  UIColor) {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.setTitle(setTitle, for: .normal)
        self.setTitleColor(setTitleColor, for: .normal)
        self.titleLabel?.font = font
    }
    
    //그림자 있는 텍스트 버튼
    func shadowButtonMakeUI(backgroundColor: UIColor, cornerRadius: CGFloat, shadowColor: CGColor, shadowOpacity: Float, shadowRadius: CGFloat, setTitle: String, font: UIFont, setTitleColor:  UIColor) {
        self.backgroundColor = backgroundColor
        self.setTitle(setTitle, for: .normal)
        self.setTitleColor(setTitleColor, for: .normal)
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = shadowColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = shadowRadius
    }
    
    // 이미지 버튼
    func buttonImageMakeUI(backgroundColor: UIColor, image: String, color: UIColor, cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: CGColor) {
        self.backgroundColor = backgroundColor
        self.setImage(UIImage(systemName: "\(image)"), for: .normal) //선택 x
        self.tintColor = color // 아이콘 색상
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
    }
    
    //그림자 있는 이미지버튼
    func shadowButtonImageMakeUI(image: String, color: UIColor, backgroundColor: UIColor, cornerRadius: CGFloat, shadowColor: CGColor, shadowOpacity: Float, shadowRadius: CGFloat) {
        self.backgroundColor = backgroundColor
        self.setImage(UIImage(systemName: "\(image)"), for: .normal) //선택 x
        self.setImage(UIImage(systemName: "\(image)"), for: .selected) //선택 o
        self.tintColor = color // 아이콘 색상
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = shadowColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = shadowRadius
    }
    
    
    
}
