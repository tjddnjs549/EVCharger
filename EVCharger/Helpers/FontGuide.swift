//
//  FontGuide.swift
//  EVCharger
//
//  Created by 박성원 on 1/9/24.
//

import UIKit

public enum FontGuide {
    
    static func customFont(size: CGFloat, lineHeight: CGFloat, isBold: Bool = false) -> UIFont {
        let fontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body)
        
        var fontAttributes: [UIFontDescriptor.AttributeName: Any] = [
            UIFontDescriptor.AttributeName.size: size,
            UIFontDescriptor.AttributeName.featureSettings: [
                [
                    UIFontDescriptor.FeatureKey.type: kNumberSpacingType,
                    UIFontDescriptor.FeatureKey.selector: kMonospacedNumbersSelector,
                ],
            ],
        ]
        
        if isBold {
            fontAttributes[UIFontDescriptor.AttributeName.traits] = [
                UIFontDescriptor.TraitKey.weight: UIFont.Weight.bold
            ]
        }
        
        let customFontDescriptor = fontDescriptor.addingAttributes(fontAttributes)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        
        return UIFont(descriptor: customFontDescriptor, size: size)
    }
    
    static let size50 = customFont(size: 50, lineHeight: 58)
    static let size50Bold = customFont(size: 50, lineHeight: 58, isBold: true)
    
    static let size36 = customFont(size: 36, lineHeight: 44)
    static let size36Bold = customFont(size: 36, lineHeight: 44, isBold: true)
    
    static let size32 = customFont(size: 32, lineHeight: 40)
    static let size32Bold = customFont(size: 32, lineHeight: 40, isBold: true)
    
    static let size26 = customFont(size: 26, lineHeight: 32)
    static let size26Bold = customFont(size: 26, lineHeight: 32, isBold: true)
    
    static let size24 = customFont(size: 24, lineHeight: 32)
    static let size24Bold = customFont(size: 24, lineHeight: 32, isBold: true)
    
    static let size19 = customFont(size: 19, lineHeight: 26)
    static let size19Bold = customFont(size: 19, lineHeight: 26, isBold: true)
    
    static let size16 = customFont(size: 16, lineHeight: 24)
    static let size16Bold = customFont(size: 16, lineHeight: 24, isBold: true)
    
    static let size14 = customFont(size: 14, lineHeight: 20)
    static let size14Bold = customFont(size: 14, lineHeight: 20, isBold: true)
}


/*
 
 사용방법
 
 let font32 = FontGuide.size32
 let font32Bold = FontGuide.size32Bold // Bold 스타일
 
 let font19 = FontGuide.size19
 let font19Bold = FontGuide.size19Bold // Bold 스타일
 
 let font16 = FontGuide.size16
 let font16Bold = FontGuide.size16Bold // Bold 스타일
 
 let font14 = FontGuide.size14
 let font14Bold = FontGuide.size14Bold // Bold 스타일
 
 */

