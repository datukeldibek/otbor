//
//  DetailsViewController.swift
//  otbor
//
//  Created by Jarae on 21/9/23.
//

import UIKit

class DetailsViewController: UIViewController {

    private lazy var status: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 26, weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        view.addSubview(status)
        
        NSLayoutConstraint.activate([
            status.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            status.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func configure(s: Status) {
        status.text = "\(s)"
        
        if s == .alive {
            status.textColor = .systemGreen
        } else if s == .dead {
            status.textColor = .systemRed
        } else {
            status.textColor = .systemBlue
        }
    }
}
