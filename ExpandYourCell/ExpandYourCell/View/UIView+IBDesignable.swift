//
//  UIView+IBDesignable.swift
//  ExpandYourCell
//
//  Created by Gamal Mostafa on 9/20/20.
//  Copyright © 2020 Orange. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable
    var viewCornerRadius: CGFloat{
        set{self.layer.cornerRadius = newValue;self.clipsToBounds = true}
        get{return self.viewCornerRadius}
    }
    
    @IBInspectable
    var borderColor: UIColor{
        set{self.layer.borderColor = newValue.cgColor}
        get{return self.borderColor}
    }

    @IBInspectable
    var borderWidth: CGFloat{
        set{self.layer.borderWidth = newValue}
        get{return self.layer.borderWidth}
    }
}
