//
//  DetectDevice.swift
//  MyFunnyFace
//
//  Created by Jonathan Go on 2018/07/31.
//  Copyright © 2018 Appdelight. All rights reserved.
//

import UIKit

public enum iOSDevice {
    case isIpad, isIpadPro, isIpadPro129
}

extension UIDevice {
    public class func whichDevice() -> iOSDevice? {
        let isDevice = { (comparision: Array<(Bool, iOSDevice)>) -> iOSDevice? in
            var device: iOSDevice?
            comparision.forEach({
                device = $0.0 ? $0.1 : device
            })
            return device
        }
        
        return isDevice([
            (UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0, iOSDevice.isIpad),
            (UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1112.0, iOSDevice.isIpadPro),
            (UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0, iOSDevice.isIpadPro129)])
    }
    
    
//    public class func whichVersion() -> iOSVersion? {
//        let systemOS = (UIDevice.current.systemVersion as NSString).floatValue
//        let isVersion = { (comparisons: Array<(Bool, iOSVersion)>) ->iOSVersion? in
//            var version: iOSVersion?
//            comparisons.forEach({
//                version = $0.0 ? $0.1 : version
//            })
//            return version
//        }
//
//        return isVersion([(systemOS < 8.0 && systemOS >= 7.0, iOSVersion.iOS7),
//                          (systemOS >= 8.0 && systemOS < 9.0, iOSVersion.iOS8),
//                          (systemOS >= 9.0 && systemOS < 10.0, iOSVersion.iOS9),
//                          (systemOS >= 10.0 && systemOS < 11.0, iOSVersion.iOS10),
//                          (systemOS >= 11.0 && systemOS < 12.0, iOSVersion.iOS11)])
//    }
    
}


private struct ScreenSize {
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

//public enum iOSVersion {
//    case iOS7, iOS8, iOS9, iOS10, iOS11
//}

