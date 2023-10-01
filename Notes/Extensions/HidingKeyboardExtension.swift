//
//  HidingKeyboardExtension.swift
//  Notes
//
//  Created by Álvaro Gómez Segovia on 30/09/23.
//

import Foundation

import Foundation
import UIKit

extension UIViewController {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
