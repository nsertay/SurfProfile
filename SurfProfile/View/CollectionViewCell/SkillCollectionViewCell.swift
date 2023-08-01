//
//  SkillCollectionViewCell.swift
//  SurfProfile
//
//  Created by Nurmukhanbet Sertay on 01.08.2023.
//

import UIKit

class SkillCollectionViewCell: UICollectionViewCell {
    static let identifier = "SkillCollectionViewCell"
    
    private let skillView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private let skillTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(skillView)
        skillView.addSubview(skillTitle)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            skillView.topAnchor.constraint(equalTo: contentView.topAnchor),
            skillView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            skillView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            skillView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            skillTitle.centerXAnchor.constraint(equalTo: skillView.centerXAnchor),
            skillTitle.centerYAnchor.constraint(equalTo: skillView.centerYAnchor)
        ])
    }
    
    func configure(with skill: String) {
        skillTitle.text = skill
    }
}
