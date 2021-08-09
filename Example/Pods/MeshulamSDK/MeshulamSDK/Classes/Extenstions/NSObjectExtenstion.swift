//
//  NSObjectExtenstion.swift
//  Alamofire
//
//  Created by Inmanage LTD on 22/06/2021.
//

import Foundation

extension NSObject {
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
