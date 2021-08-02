//
//  PaymentManager.swift
//  MeshulamSDK
//
//  Created by Inmanage LTD on 31/05/2021.
//

import Foundation
import UIKit

protocol PaymentManagerToBitStatusVCDelegate: class {
    func createPaymentProcessSuccess()
    func setBitPaymentFailure()
    func setBitPaymentSuccess(_ getPaymentInfoResponse: String)
    func cancelBitPayment()
    func bitOpened()
}

public class PaymentManager {
    
    public static var shared = PaymentManager()
    
    weak var delegate: PaymentManagerToBitStatusVCDelegate?
    
    //if it's true getBitPatymentRequest not called, trigger is X button on BitStatusVIewController
    public var isTappedOnExitBtn = false
    private var response = false
    public var createPaymentProcess: CreatePaymentProcessResponse?

    public func callCreatePaymentProcess(requestFinishDelegate: RequestFinishedProtocol? = nil) {
        PaymentManager.shared.isTappedOnExitBtn = false
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
    
    public func callSetBitPaymentRequest(requestFinishDelegate: RequestFinishedProtocol? = nil) {
        let delegate   = requestFinishDelegate == nil ? self : requestFinishDelegate
        let parameters = SetBitPaymentRequest.createSetBitPaymentParams()
        let request    = SetBitPaymentRequest().initWithDictParams(parameters, delegate)
        request.showErrorMsg = false
        NetworkManager.shared.sendRequest(request)
    }
    
    private func handleBitAppStartProcces() {
        let url = createPaymentProcess?.url ?? ""
        if let url = URL(string: url) {
            UIApplication.shared.open(url, options: Dict()) { _ in
                self.delegate?.bitOpened()
            }
        }
    }
    
    private func userDidaponExitButton() -> Bool {
        return isTappedOnExitBtn
    }
    
    private func getError(from response: BaseServerResponse) -> Error {
        let error = Error(id: response.errorResponse.id,
                          errorMessage: response.errorResponse.message)
        return error
    }
}

extension PaymentManager: RequestFinishedProtocol {
    
    public func requestSucceeded(request: BaseRequest, response: BaseInnerResponse) {
        let requestName = request.requestName
        switch requestName {
       
        case ServerRequests.createPaymentProcess:
            if let response = response as? CreatePaymentProcessResponse {
                createPaymentProcess = response
                if !userDidaponExitButton() {
                    delegate?.createPaymentProcessSuccess()
                    handleBitAppStartProcces()
                }
            }
            break
            
        case ServerRequests.cancelBitPayment:
            delegate?.cancelBitPayment()
            break
            
        case ServerRequests.setBitPayment:
            delegate?.setBitPaymentSuccess(<#String#>)// TODO add transactionId to setBitPaymentSuccess
            break
            
        default: break
        }
    }
    
    public func requestFailed(request: BaseRequest, response: BaseServerResponse?) {
        if let response = response {
            let requestName = request.requestName
            
            switch requestName {
            
            case ServerRequests.setBitPayment:
                delegate?.setBitPaymentFailure()
                break
            default: break
            }
            
            let error = getError(from: response)
            Meshulam.shared().delegate?.onFailure(error)
        }
    }
}


