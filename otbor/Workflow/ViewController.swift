//
//  ViewController.swift
//  otbor
//
//  Created by Jarae on 21/9/23.
//

import UIKit

class ViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var characters = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchCharacters()
    }
    
    func setup() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseID)
    }

    func fetchCharacters() {
        NetworkService.shared.getCharacters { result in
            DispatchQueue.main.async {
                self.characters = result
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reuseID, for: indexPath) as? CustomCell
        let model = characters[indexPath.row]
        cell?.configure(char: model)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        let model = characters[indexPath.row]
        vc.configure(s: model.status)
        navigationController?.pushViewController(vc, animated: true)
    }
}

