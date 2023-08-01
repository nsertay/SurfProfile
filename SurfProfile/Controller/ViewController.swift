//
//  ViewController.swift
//  SurfProfile
//
//  Created by Nurmukhanbet Sertay on 01.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private let model = SkillModel()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UserInfoTableViewCell.self, forCellReuseIdentifier: UserInfoTableViewCell.identifier)
        tableView.register(SkillsTableViewCell.self, forCellReuseIdentifier: SkillsTableViewCell.identifier)
        tableView.register(AboutMeTableViewCell.self, forCellReuseIdentifier: AboutMeTableViewCell.identifier)
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        
        setupViews()
        setupConstraints()
        setupTableView()
    }
    
    // MARK: - View Setup
    
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - Table View Setup
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.identifier, for: indexPath) as! UserInfoTableViewCell
            cell.setClearBackground()
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: SkillsTableViewCell.identifier, for: indexPath) as! SkillsTableViewCell
            cell.setClearBackground()
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: AboutMeTableViewCell.identifier, for: indexPath) as! AboutMeTableViewCell
            cell.setClearBackground()
            return cell
            
        default:
            fatalError("Invalid row")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
