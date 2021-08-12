//
//  BaseInnerResponse.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 26/05/2021.
//

import Foundation

public class BaseInnerResponse: NSObject {
    
    var id: Int = 0
    
    required override init() {
        super.init()
    }
    
    @objc @discardableResult dynamic public func buildFromJSONDict(JSONDict: Dict) -> BaseInnerResponse {
        id = MeshulamParseValidator.getIntForKey(key: "id", JSONDict: JSONDict, defaultValue: 0)
        return self
    }
}
