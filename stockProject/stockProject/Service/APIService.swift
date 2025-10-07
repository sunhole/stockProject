//
//  APIService.swift
//  stockProject
//
//  Created by vision on 10/6/25.
//

import Foundation
import RxSwift

class APIService {
    func fetchStockData() -> Observable<[Stock]> {
        return Observable.create { observer in
            let dummyStocks = [
                Stock(symbol: "AAPL", name: "Apple", price: 175.25, change: 1.5, chagePercentage: 0.86),
                Stock(symbol: "GOOG", name: "Alphabet", price: 135.50, change: -0.7, chagePercentage: -0.52),
                Stock(symbol: "MSFT", name: "Microsoft", price: 340.80, change: 3.2, chagePercentage: 0.95),
                Stock(symbol: "TSLA", name: "Tesla", price: 250.10, change: -2.5, chagePercentage: -0.99),
                Stock(symbol: "AMZN", name: "Amazon", price: 140.75, change: 0.9, chagePercentage: 0.64)
            ]
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                observer.onNext(dummyStocks)
                observer.onCompleted()
            })
            //수동 메모리 해제 
            return Disposables.create()
        }
    }
}
