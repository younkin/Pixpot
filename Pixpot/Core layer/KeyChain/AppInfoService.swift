//
//  AppInfoService.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 20.01.23.
//


import Foundation

protocol ISensentiveInfoService: AnyObject {
    func getToken() -> String?
//    func saveToken(token: String, completionHandler: FinishedCompletionHandler)
    func saveAppleToken(token: String)
    func saveNotificationToken(token: String)
//    func deleteAllInfo(completionBlock: FinishedCompletionHandler)
    func isUserInApp() -> Bool
    func savePremium()
    func isPremiumActive() -> Bool
    func getAppleToken() -> String?
    func wasPushAsked() -> Bool
    func changeAskPushValue()
}

class AppInfoService: ISensentiveInfoService {
    
    private let secureStorage: ISecureStorage
    private let appSettingsStorage: IUserDefaultsSettings

    init(
        secureStorage: ISecureStorage,
        userInfoStorage: IUserDefaultsSettings
    ) {
        self.secureStorage = secureStorage
        self.appSettingsStorage = userInfoStorage
    }
    
    func getToken() -> String? {
        secureStorage.getToken()
    }
    
//    func saveToken(token: String, completionHandler: FinishedCompletionHandler) {
//        changeUserInAppValue(isUserInApp: true)
//        secureStorage.saveToken(token: token, completionHandler: completionHandler)
//    }
    
    func saveAppleToken(token: String) {
        secureStorage.saveAppleToken(token: token)
    }
    
//    func deleteAllInfo(completionBlock: (Bool) -> ()) {
//        changeUserInAppValue(isUserInApp: false)
//        secureStorage.deleteAllInfo(completionBlock: completionBlock)
//    }
    
    func isUserInApp() -> Bool {
        return appSettingsStorage.getUserInAppValue()
    }
    
    func savePremium() {
        secureStorage.savePremium()
    }
    
    func isPremiumActive() -> Bool {
        secureStorage.premiumIsActive()
    }
    
    func getAppleToken() -> String? {
        secureStorage.getAppleToken()
    }
    
    private func changeUserInAppValue(isUserInApp: Bool) {
        appSettingsStorage.changeUserInAppValue(on: isUserInApp)
    }
    
    func saveNotificationToken(token: String) {
        secureStorage.savePushToken(token: token)
    }
    
    func wasPushAsked() -> Bool {
        appSettingsStorage.getAskPushValue()
    }
    
    func changeAskPushValue() {
        appSettingsStorage.changePushAsked(value: true)
    }
}

