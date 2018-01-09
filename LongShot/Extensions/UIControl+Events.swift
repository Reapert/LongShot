//
//  UIControl+Events.swift
//  LongShot
//
//  Created by Brandon on 2018-01-01.
//  Copyright © 2018 XIO. All rights reserved.
//

import Foundation
import UIKit

public extension UIControl {
    @discardableResult
    public func addEventHandler<T>(_ event: UIControlEvents, runnable: @escaping (_ control: T) -> Void) -> RemovableTarget where T: UIControl {
        return EventTarget(self, event: event) { (control) in
            runnable(control as! T)
        }
    }
}
