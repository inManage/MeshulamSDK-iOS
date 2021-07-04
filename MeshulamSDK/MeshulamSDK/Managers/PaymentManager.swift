//
//  PaymentManager.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 31/05/2021.
//

import Foundation
import UIKit

protocol PaymentManagerDelegate: class {
    func createPaymentProcessResponseSucceeded(with response: CreatePaymentProcessResponse)
}

public class PaymentManager {
    
    public static var shared = PaymentManager()
    
    weak var delegate: PaymentManagerDelegate?
    public var isTappedOnExitBtn = false
    public var createPaymentProcess: CreatePaymentProcessResponse?

    public func callCreatePaymentProcess(requestFinishDelegate: RequestFinishedProtocol? = nil) {
        let delegate   = requestFinishDelegate == nil ? self : requestFinishDelegate
        let parameters = CreatePaymentProcessRequest.createPaymentProcessDictParams()
        let request    = CreatePaymentProcessRequest().initWithDictParams(parameters, delegate)
        NetworkManager.shared.sendRequest(request)
    }
    
    public func callGetBitPaymentStatusRequest(requestFinishDelegate: RequestFinishedProtocol? = nil) {
        let delegate   = requestFinishDelegate == nil ? self : requestFinishDelegate
        let parameters = Dict()//CreatePaymentStatusRequest.createPaymentProcessDictParams()
        let request    = GetBitPaymentStatusRequest().initWithDictParams(parameters, delegate)
        NetworkManager.shared.sendRequest(request)
    }
    
    public func callCancelBitPaymentRequest(requestFinishDelegate: RequestFinishedProtocol? = nil) {
        let delegate   = requestFinishDelegate == nil ? self : requestFinishDelegate
        let parameters = CancelBitPaymentRequest.createCancelBitPaymentParams()
        let request    = CancelBitPaymentRequest().initWithDictParams(parameters, delegate)
        NetworkManager.shared.sendRequest(request)
    }
    
    private func openBitApp() {
        let url = createPaymentProcess?.url ?? ""
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
}

extension PaymentManager: RequestFinishedProtocol {
    public func requestFailed(request: BaseRequest, response: BaseServerResponse?) {
        if let response = response {
            let error = Error(id: response.errorResponse.id, errorMessage: response.errorResponse.message)
            Meshulam.shared().delegate?.onFailure(error)
        }
    }
    
    public func requestSucceeded(request: BaseRequest, response: BaseInnerResponse) {
        let requestName = request.requestName
        switch requestName {
       
        case ServerRequests.createPaymentProcess:
            if let response = response as? CreatePaymentProcessResponse {
                createPaymentProcess = response
                if isTappedOnExitBtn {
                    callCancelBitPaymentRequest()
                } else {
                    openBitApp()
                    delegate?.createPaymentProcessResponseSucceeded(with: response)
                }
            }
            break
            
        case ServerRequests.cancelBitPayment:
            Meshulam.shared().delegate?.onCancel()
            Meshulam.destroy()
            break
        default: break
        }
    }
}


