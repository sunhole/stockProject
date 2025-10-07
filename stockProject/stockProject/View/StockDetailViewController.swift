//
//  StockDetailViewController.swift
//  stockProject
//
//  Created by vision on 10/8/25.
//

import UIKit
import RxSwift
import RxCocoa

class StockDetailViewController: UIViewController {
    private let stock: Stock
    private let symbolLabel = UILabel()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    private let changeLabel = UILabel()
    
    init(stock: Stock) {
        self.stock = stock
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configure(with: stock)
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [symbolLabel, nameLabel, priceLabel, changeLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func configure(with stock: Stock) {
        title = stock.name
        symbolLabel.text = "종목 코드: \(stock.symbol)"
        nameLabel.text = "종목명: \(stock.name)"
        priceLabel.text = "현재가: $\(String(format: "%.2f", stock.price))"
        changeLabel.text = "등락률: \(String(format: "%.2f", stock.chagePercentage))%"
    }
}
