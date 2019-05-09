//
//  VolumeManager.swift
//  WorkSpace
//
//  Created by Saurel on 2019/05/02.
//  Copyright © 2019 ryookano. All rights reserved.
//

import UIKit

open class VolumeOverlay: NSObject {
    
    public static var shared = VolumeOverlay()

    var dummyVolumeView = DummyVolumeView()
    var volumeView = VolumeView()
    var displayTimer: Timer?
    let statusBarHeight: CGFloat = 20.0
    let animationDuration = 0.25
    let volumeParameterKey = "AVSystemController_AudioVolumeNotificationParameter"
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    open func load() {
        let windows = UIApplication.shared.windows
        windows.first?.addSubview(dummyVolumeView)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(volumeChanged(notification:)),
                                               name: NSNotification.Name.volumeNotificationKey,
                                               object: nil)
    }
    
    func show() {
        restartTimer()

        volumeView.isHidden = false
        volumeView.makeKeyAndVisible()
        volumeView.layer.removeAllAnimations()
        UIWindow.animate(withDuration: animationDuration, animations: {
            self.volumeView.frame = CGRect(x: self.volumeView.frame.origin.x,
                                           y: 0.0,
                                           width: self.volumeView.frame.width,
                                           height: self.volumeView.frame.height)
        })
    }
    
    @objc func hide() {
        volumeView.layer.removeAllAnimations()
        UIWindow.animate(withDuration: animationDuration, animations: {
            self.volumeView.frame = CGRect(x: self.volumeView.frame.origin.x,
                                           y: -self.volumeView.frame.height,
                                           width: self.volumeView.frame.width,
                                           height: self.volumeView.frame.height)
        }, completion: { (completed) in
            
        })
    }
    
    func set(volume: Float) {
        show()
        volumeView.changeVolume(volume: volume)
    }

    func restartTimer() {
        if displayTimer != nil {
            displayTimer?.invalidate()
            displayTimer = nil
        }
        
        self.displayTimer = Timer.scheduledTimer(
            timeInterval: 2.0,
            target: self,
            selector: #selector(hide),
            userInfo: nil,
            repeats: false
        )
    }
    
    @objc func volumeChanged(notification: Notification) {
        if let volume = notification.userInfo?[volumeParameterKey] as? Float {
            set(volume: volume)
        }
    }
}
