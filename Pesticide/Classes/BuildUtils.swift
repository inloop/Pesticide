//
//  BuildUtils.swift
//  debugdrawer
//
//  Created by Elias Bagley on 11/21/14.
//  Copyright (c) 2014 Rocketmade. All rights reserved.
//

import Foundation

let kGitHashKey = "GITHash"
let kDateKey = "BuildDateKey"

class BuildUtils {
    class func getGitHash() -> String {
        if let hash =  Bundle.main.object(forInfoDictionaryKey: kGitHashKey) as? String {
            return hash
        }

        return ""
    }

    class func getBuildNumberString() -> String {
        if let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            return buildNumber
        }

        return ""
    }

    class func getVersionString() -> String {
        if let buildNumber = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return buildNumber
        }

        return ""
    }

    class func getDateString() -> String {
        if let hash =  Bundle.main.object(forInfoDictionaryKey: kDateKey) as? String {
            return hash
        }

        return ""
    }

}
