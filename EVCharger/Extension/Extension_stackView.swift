//
//  Extension_stackView.swift
//  EVCharger
//
//  Created by 박성원 on 1/9/24.
//

import UIKit


public extension UIStackView {
    
     func addArrangedSubviews(_ views: UIView...) {
         for view in views {
             self.addArrangedSubview(view)
         }
     }
    
    func removeAllSubViews() {
      self.subviews.forEach {
        self.removeFromStackView($0)
      }
    }

    func removeFromStackView(_ view: UIView) {
      view.removeFromSuperview()
      self.removeArrangedSubview(view)
    }
}
