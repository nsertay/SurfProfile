//
//  UserInfoTableViewCell.swift
//  SurfProfile
//
//  Created by Nurmukhanbet Sertay on 01.08.2023.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {

    static let identifier = "UserInfoTableViewCell"

    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "profileImage")
        imageView.layer.cornerRadius = 60
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Иванов Иван Иванович"
        label.numberOfLines = 2
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    
    private let jobLabel: UILabel = {
        let label = UILabel()
        label.text = "Intern iOS-разработчик, опыт более 2-х месяцев"
        label.numberOfLines = 1
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = UIColor.systemGray
        return label
    }()
    
    private let markView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "cityImage")
        
        return imageView
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Воронеж"
        label.numberOfLines = 2
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = UIColor.systemGray
        return label
    }()
    
    lazy var xStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [markView, cityLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 1
        return stackView
    }()
    
    lazy var yStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, jobLabel, xStack])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(profileImage)
        contentView.addSubview(yStack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            profileImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 120),
            profileImage.heightAnchor.constraint(equalToConstant: 120),
        ])
        
        NSLayoutConstraint.activate([
            yStack.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20),
            yStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 70),
            yStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -70),
            yStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
        NSLayoutConstraint.activate([
            markView.widthAnchor.constraint(equalToConstant: 16),
            markView.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
}
