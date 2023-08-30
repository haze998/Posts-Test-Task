//
//  Extension + UIView.swift
//  PostsTestApp
//
//  Created by Evgeniy Docenko on 30.08.2023.
//

import UIKit

extension UIView {
    func addSubviews(view: [UIView]) {
        view.forEach { view in
            addSubview(view)
        }
    }
}
