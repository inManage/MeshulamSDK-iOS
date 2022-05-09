//
//  ContentView.swift
//  ExampleSwiftUI
//
//  Created by Omer Cohen on 09/05/2022.
//

import SwiftUI
import MeshulamSDK
import Combine

@available(iOS 13.0, *)
class viewmodel : ObservableObject {
    
    var publishr :PassthroughSubject<SubjectType, Never> = .init()
    var configureMeshulamSDK :PassthroughSubject<Void, Never> = .init()
    var settleSuspendedTransaction :PassthroughSubject<Void, Never> = .init()
    var handleGetPaymentProcessInfo :PassthroughSubject<Void, Never> = .init()
    var handleCancelBitTransaction :PassthroughSubject<Void, Never> = .init()
    var cancellable = Set<AnyCancellable>()
    
    var transactionId = ""
    var processId = ""
    var processToken = ""
    
    init(){
        
        configureMeshulamSDK.sink { _ in
            // Live
            //            let fields = MeshulamPaymentFields(pageCode: "535dd4248592", apiKey: "566ac39a90e8", userId: "b9e895139851c3c5", fullName: "Amit Azulay", phone: "0525503409", sum: "1", email: "omerm@inmanage.com", description: "תשלום עבורXXXX", saveCardToken: nil, companyCommission: 0.5)
            
            // Dev
            let fields = MeshulamPaymentFields(pageCode: "acf7864cd5ca", apiKey: "7a0d103abb5a", userId: "a20750bbad55a928", fullName: "Amit Azulay", phone: "0525503409", sum: "1", email: "omerm@inmanage.com", description: "תשלום עבורXXXX", saveCardToken: nil, companyCommission: 0.5)
            
            
            Meshulam.shared().createPaymentProcess(paymentFeilds: fields)
        }
        .store(in: &cancellable)
        
        
        settleSuspendedTransaction.sink { _ in
            Meshulam.shared().settleSuspendedTransaction(apiKey: "cbf3b862e094",
                                                         userId: "41deb6f1347ee8b2", pageCode: "535dd4248592",
                                                         sum: "1",
                                                         transactionId: self.transactionId)
            
        }.store(in: &cancellable)
        
        handleGetPaymentProcessInfo.sink { _ in
            
            Meshulam.shared().getPaymentProcessInfo(processId: self.processId,
                                                    processToken: self.processToken, pageCode: "535dd4248592")
            
        }.store(in: &cancellable)
        
        handleCancelBitTransaction.sink { _ in
            Meshulam.shared().cancelBitTransaction(processId: self.processId,
                                                   processToken: self.processToken,
                                                   pageCode: "535dd4248592")
            
        }.store(in: &cancellable)
        
        publishr.sink { callbackRespons in
            let type = callbackRespons.type
            switch type {
            case .start:
                print("meshulam did start is view and call publisher")
            case .failure:
                if let mehulamEroor = callbackRespons.error {
                    print("meshulam did fail is view and call publisher error: \(mehulamEroor)")
                }
            case .paymentSuccess:
                if let processId = callbackRespons.processId {
                    self.processId = processId
                }
                
                if let processToken = callbackRespons.processToken {
                    self.processToken = processToken
                }
                if let response = callbackRespons.paymentProccesResponse {
                    
                    print("meshulam did success pay is view and call publisher with response:")
                    print("\(response)")
                }
            case .suspendedTransactionSuccess:
                if let response = callbackRespons.suspendedTransactionResponse {
                    print("meshulam did finish suspended  is view and call publisher with response:")
                    print("\(response)")
                }
            case .processInfo:
                if let info = callbackRespons.ProcessInfoResponse {
                    print("meshulam did get info is view and call publisher with response:")
                    print("\(info)")
                }
            case .dismiss:
                print("meshulam did dismiss is view and call publisher ")
            case .cancel:
                print("meshulam did cancel is view and call publisher ")
            case .bitPaymentSuccess:
                print("meshulam bitPaymentSuccess publisher ")
            }
            
        }
        .store(in: &cancellable)
        
        Meshulam.shared().setMeshulamPublisher(subscriber: self.publishr)
    }
}

@available(iOS 13.0, *)
struct MeshulamSimpleSwiftUIExmaple: View {
    let vm : viewmodel = viewmodel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Example")
                .bold()
                .font(Font.custom("Helvetica Neue", size: 36.0))

            VStack {
                Button(action: {
                    self.vm.configureMeshulamSDK.send()
                }){
                    Text("שלם באמצעות Bit")
                    .bold()
                    .font(Font.custom("Helvetica Neue", size: 24.0))
                    .padding(20)
                    .foregroundColor(Color.blue)
                }
                Spacer()
                Button(action: {
                    self.vm.settleSuspendedTransaction.send()
                }){
                    Text("החל בהכנה")
                    .bold()
                    .font(Font.custom("Helvetica Neue", size: 24.0))
                    .padding(20)
                    .foregroundColor(Color.blue)
                }
                Spacer()
                Button(action: {
                    self.vm.handleCancelBitTransaction.send()
                }){
                    Text("ביטול עסקה")
                    .bold()
                    .font(Font.custom("Helvetica Neue", size: 24.0))
                    .padding(20)
                    .foregroundColor(Color.blue)
                }
                Spacer()
                Button(action: {
                    self.vm.handleGetPaymentProcessInfo.send()
                }){
                    Text("מידע על עסקה")
                    .bold()
                    .font(Font.custom("Helvetica Neue", size: 24.0))
                    .padding(20)
                    .foregroundColor(Color.blue)
                }
            }
        }.padding(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    @available(iOS 13.0.0, *)
    static var previews: some View {
        MeshulamSimpleSwiftUIExmaple()
    }
}

