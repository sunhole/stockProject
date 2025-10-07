//
//  StockListViewController.swift
//  stockProject
//
//  Created by vision on 10/6/25.
//

import UIKit
import RxSwift
import RxCocoa

class StockListViewController: UIViewController {
    private let viewModel = StockListViewModel()
    private let disposeBag = DisposeBag()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchStocks()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "내 주식"
        //테이블뷰 셋업 UI
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        //테이블뷰 등록
        tableView.register(StockCell.self, forCellReuseIdentifier: "StockCell")
    }
    
    //MARK: - bind
    private func bindViewModel() {
        //viewmodel의 stock데이터를 데이블 뷰에 바인딩
        viewModel.stocks
            .bind(to: tableView.rx.items(cellIdentifier: "StockCell", cellType: StockCell.self)) { row, stock, cell in
                cell.configure(with: stock)
            }
            .disposed(by: disposeBag)
        
        // 테이블 뷰 셀 탭 이벤트 처리
        tableView.rx.modelSelected(Stock.self)
            .subscribe(onNext: { stock in
                let detailVC = StockDetailViewController(stock: stock)
                self.navigationController?.pushViewController(detailVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
}

