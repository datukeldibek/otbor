//
//  CustomCell.swift
//  otbor
//
//  Created by Jarae on 21/9/23.
//

import UIKit

class CustomCell: UITableViewCell {

    static let reuseID = String(describing: CustomCell.self)
    
    private lazy var picture: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 35
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var title: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func layoutSubviews() {
        setup()
    }
    
    func setup() {
        contentView.addSubview(picture)
        contentView.addSubview(title)
        
        NSLayoutConstraint.activate([
            picture.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            picture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            picture.widthAnchor.constraint(equalToConstant: 70),
            picture.heightAnchor.constraint(equalToConstant: 70),
            
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: picture.trailingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    func configure(char: Result) {
        title.text = char.name
        if let image = UIImage(data: NetworkService.shared.donwloadImage(url: char.image)) {
            picture.image = image
        }
    }
}
