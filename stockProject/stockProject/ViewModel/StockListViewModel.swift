//
//  StockListViewModel.swift
//  stockProject
//
//  Created by vision on 10/6/25.
//

import Foundation
import RxSwift
import RxCocoa

class StockListViewModel {
    private let apiService = APIService()
    private let disposeBag = DisposeBag()
    
    // Output: View로 전달할 데이터
    var stocks = BehaviorSubject<[Stock]>(value: [])
    
    init() {
        self.stocks = BehaviorSubject<[Stock]>(value: [])
    }
    
    // Input: View로부터 받은 사용자 액션
    func fetchStocks() {
        apiService.fetchStockData()
            .subscribe(onNext: { [weak self] stockArray in
                // 받은 배열 데이터를 그대로 stocks에 주입
                self?.stocks.onNext(stockArray)
            }, onError: { error in
                print("Error: \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)
    }
}
