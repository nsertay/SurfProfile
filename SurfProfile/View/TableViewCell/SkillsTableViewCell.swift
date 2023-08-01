//
//  SkillsTableViewCell.swift
//  SurfProfile
//
//  Created by Nurmukhanbet Sertay on 01.08.2023.
//

import UIKit

class SkillsTableViewCell: UITableViewCell {
    
    static let identifier = "SkillsTableViewCell"
    
    private var skills = SkillModel().skills
    
    private let titleOfSkills: UILabel = {
        let label = UILabel()
        label.text = "Мои навыки"
        label.numberOfLines = 2
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textColor = UIColor.black
        label.textAlignment = .center
        
        return label
    }()
    
    private let editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "editImage"), for: .normal)
        
        return button
    }()
    
    private var isEditingSkills: Bool = false
    
    lazy var yStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleOfSkills, UIView(), editButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.alignment = .center
        
        return view
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SkillCollectionViewCell.self, forCellWithReuseIdentifier: SkillCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        
        setupViews()
        setupConstraints()
        addTargets()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            // Set the inter-item spacing (horizontal and vertical)
            flowLayout.minimumInteritemSpacing = 10 // Adjust the value as needed
            
            // Set the line spacing (space between rows or columns)
            flowLayout.minimumLineSpacing = 10 // Adjust the value as needed
            
            // Optionally, you can also set the section insets to add margins around the content
            flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("error with SkillsTableViewCell")
    }
    
    func setupViews() {
        contentView.addSubview(yStack)
        contentView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            yStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            yStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            yStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            editButton.widthAnchor.constraint(equalToConstant: 24),
            editButton.heightAnchor.constraint(equalToConstant: 24),
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: yStack.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 220),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
    
    func addTargets() {
        editButton.addTarget(self, action: #selector(editButtonDidTapped), for: .touchUpInside)
    }
    
    @objc func editButtonDidTapped() {
        isEditingSkills = isEditingSkills ? false : true
        
        let buttonImage = isEditingSkills ? "confirmationImage" : "editImage"
        editButton.setImage(UIImage(named: buttonImage), for: .normal)
        
        if isEditingSkills {
            for (index, _) in skills.enumerated() {
                skills[index] = skills[index] + "  x"
            }
            skills.append("   +   ")
            collectionView.reloadData()
        } else {
            for (index, _) in skills.enumerated() {
                skills[index] = skills[index].replacingOccurrences(of: "  x", with: "")
            }
            skills.removeLast()
            collectionView.reloadData()
        }
    }
    
    func getRootViewController() -> UIViewController? {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate
        {
            return sceneDelegate.window?.rootViewController
        }
        return nil
    }
    
    func newSkillButtonTapped() {
        let alert = UIAlertController(title: "Добавление навыка", message: "Введите название навыка, которым вы владеете", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Отмена", style: .default))
        
        let addAction = UIAlertAction(title: "Добавить", style: .default, handler: { [weak self] _ in
            guard let self = self, let newSkill = alert.textFields?.first?.text else {
                return
            }
            
            self.skills.insert(newSkill, at: skills.count - 1)
            self.collectionView.reloadData()
        })
        
        alert.addAction(addAction)
        getRootViewController()?.present(alert, animated: true)
    }
}


extension SkillsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skills.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkillCollectionViewCell.identifier, for: indexPath) as! SkillCollectionViewCell
        cell.configure(with: skills[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isEditingSkills, skills[indexPath.row] ==  "   +   " {
            newSkillButtonTapped()
        } else if isEditingSkills {
            skills.remove(at: indexPath.row)
            collectionView.reloadData()
        }
    }
}

extension SkillsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let title = skills[indexPath.row]
        let width = title.size(withAttributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)
        ]).width
       
        
        return CGSize(width: width, height: 50)
    }
}
