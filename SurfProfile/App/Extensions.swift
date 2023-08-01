//
//  Extensions.swift
//  SurfProfile
//
//  Created by Nurmukhanbet Sertay on 01.08.2023.
//

import UIKit

extension UITableViewCell {
    func setClearBackground() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        self.selectedBackgroundView = backgroundView
    }
}
