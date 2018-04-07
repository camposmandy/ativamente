//
//  DesignableView.swift
//
//  Created by Amanda Campos.
//

import Foundation
import UIKit


extension UIView {
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var clipping: Bool {
        get {
            return clipsToBounds
        }
        set {
            clipsToBounds = newValue
        }
    }
    
}

@IBDesignable
class ACImageView: UIImageView {
    @IBInspectable
    var clips: Bool {
        get {
            return self.clipsToBounds
        }
        set {
            self.clipsToBounds = newValue
        }
    }

}

@IBDesignable
class ACButton: UIButton {

    @IBInspectable
    var roundRadius: Bool = false

    override func layoutSubviews() {
        super.layoutSubviews()
        if roundRadius {
            layer.cornerRadius = frame.height/2.0
        }
        
    }
}

@IBDesignable
class ACSegmentedControl: UISegmentedControl {
    
    @IBInspectable
    var roundRadius: Bool = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if roundRadius {
            layer.cornerRadius = frame.height/2.0
        }
        
    }
}

@IBDesignable
class ACLabel: UILabel {}

@IBDesignable
class ACView: UIView {}

@IBDesignable
class ACTextField: UITextField {}

@IBDesignable
class ACTextView: UITextView {}

@IBDesignable
class ACViewBlur: UIVisualEffectView {}

@IBDesignable
class RHCollectionViewCell: UICollectionViewCell {}
