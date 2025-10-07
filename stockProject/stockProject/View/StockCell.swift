//
//  StockCell.swift
//  stockProject
//
//  Created by vision on 10/6/25.
//

import UIKit

class StockCell: UITableViewCell {
    let symbolLabel = UILabel() //주식 종목
    let priceLabel = UILabel() //현재 주가
    let changePercentageLabel = UILabel() //등락율
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        // 라벨들을 셀에 추가
        contentView.addSubview(symbolLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(changePercentageLabel)
        
        // AutoLayout 설정
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        changePercentageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // symbolLabel 제약
            symbolLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            symbolLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // priceLabel 제약
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // changePercentageLabel 제약
            changePercentageLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -10),
            changePercentageLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    // 셀에 데이터를 주입하는 메서드
    func configure(with stock: Stock) {
        symbolLabel.text = stock.name
        priceLabel.text = "$\(String(format: "%.2f", stock.price))"
        changePercentageLabel.text = "\(String(format: "%.2f", stock.chagePercentage))%"
        
        // 등락에 따라 텍스트 색상 변경
        if stock.chagePercentage > 0 {
            changePercentageLabel.textColor = .systemGreen
        } else if stock.chagePercentage < 0 {
            changePercentageLabel.textColor = .systemRed
        } else {
            changePercentageLabel.textColor = .systemGray
        }
    }
}
