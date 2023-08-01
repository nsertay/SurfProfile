//
//  AboutMeTableViewCell.swift
//  SurfProfile
//
//  Created by Nurmukhanbet Sertay on 01.08.2023.
//

import UIKit

class AboutMeTableViewCell: UITableViewCell {

    static let identifier = "AboutMeTableViewCell"

    private let aboutMeTitle: UILabel = {
        let label = UILabel()
        label.text = "О себе"
        label.numberOfLines = 1
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    private let aboutMeText: UILabel = {
        let label = UILabel()
        label.text = "Experienced software engineer skilled in developing scalable and maintainable systems"
        label.numberOfLines = 0
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("error with UserInfoTableViewCell")
    }

    func setupViews() {
        contentView.addSubview(aboutMeTitle)
        contentView.addSubview(aboutMeText)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            aboutMeTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
            aboutMeTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            aboutMeText.topAnchor.constraint(equalTo: aboutMeTitle.bottomAnchor, constant: 10),
            aboutMeText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            aboutMeText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            aboutMeText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }

}
