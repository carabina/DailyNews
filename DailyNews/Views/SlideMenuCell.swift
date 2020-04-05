//
//  SlideMenuCell.swift
//  DailyNews
//
//  Created by Latif Atci on 4/1/20.
//  Copyright © 2020 Latif Atci. All rights reserved.
//

import UIKit

class SlideMenuCell : UITableViewCell {
    
    var menuLabel : UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 12)
        return label
    }()
    
    var sources : Sources? {
        didSet {
            if let sources = sources {
            textLabel?.text = sources.name
            }
        }
    }
    
    var slideDelegate : SlideMenuTableViewDelegate?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        let starButton = UIButton(frame: .init(x: 0, y: 0, width: 50, height: 50))
        starButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        
        starButton.addTarget(self, action: #selector(addFavorite), for: .touchUpInside)
        
        accessoryView = starButton
    }
    
    @objc func addFavorite(button : UIButton) {

        slideDelegate?.configureFavoriteSources(cell: self)
    }
    
    
    
    
    
}
