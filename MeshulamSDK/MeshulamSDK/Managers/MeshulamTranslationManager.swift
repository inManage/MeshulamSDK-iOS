//
//  TranslationManager.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 02/03/2022.
//

import Foundation

public class MeshulamTranslationManager {
    
    static var sharedInstance = MeshulamTranslationManager()
    
    var dictTranslations: Dict = [:]
    
    //MARK: General functions
    
    func translationForKey(key :String, withDefaultValue defaultValue: String) -> (String) {
        
        var strTranslation = ""
        
        if dictTranslations.isEmpty {
            dictTranslations = loadTranslationsFromDisk()
        }
        
        if dictTranslations.isEmpty {
            return defaultValue
        }
        
        if dictTranslations[key] is String {
            strTranslation = dictTranslations[key] as! String
        }
                
        if strTranslation.isEmpty {
            strTranslation = defaultValue
        }
        
        strTranslation = strTranslation.replacingOccurrences(of: "\\", with: "")
        
        return strTranslation
    }
    
    func loadTranslationsFromDisk() -> ([String: Any]) {
        
        var dictToLoad = [String: Any]()
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        var basePath : String = paths[0]
        basePath = basePath.appending("/translationsArr")
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: basePath) as? [String : Any] else {
            return dictToLoad
        }
        
        dictToLoad = data
        
        return dictToLoad
    }
    
    func saveTranslationsToDisk(dictTranslation: [String: Any]) {
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        var basePath : String = paths[0]
        basePath = basePath.appending("/translationsArr")
        
        NSKeyedArchiver.archiveRootObject(dictTranslation, toFile: basePath)
    }
}

//Global translation function
func Translation(_ key: String, _ withDefaultValue: String) -> (String) {
    return MeshulamTranslationManager.sharedInstance.translationForKey(key: key, withDefaultValue: withDefaultValue)
}


