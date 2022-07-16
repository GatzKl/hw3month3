//
//  LetterCell.swift
//  lesson3
//
//  Created by Александр Калашников on 14/7/22.
//

import Foundation
import UIKit

class LetterCell: UICollectionViewCell {
    lazy var letterLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    override func layoutSubviews() {
        backgroundColor = .lightGray
        
        addSubview(letterLabel)
        letterLabel.translatesAutoresizingMaskIntoConstraints = false
        letterLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        letterLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        
        
    }
}
