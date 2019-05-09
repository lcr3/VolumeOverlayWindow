//
//  Extentions.swift
//  WorkSpace
//
//  Created by Saurel on 2019/05/03.
//  Copyright © 2019 ryookano. All rights reserved.
//

import UIKit

public extension NSNotification.Name {
    static let volumeNotificationKey = Notification.Name(rawValue: "AVSystemController_SystemVolumeDidChangeNotification")
}

public extension UIDevice {
    static var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
