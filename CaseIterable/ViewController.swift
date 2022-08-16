//
//  ViewController.swift
//  CaseIterable
//
//  Created by Вячеслав Квашнин on 16.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    enum Menu: String, CaseIterable {
        case one = "One"
        case two = "Two"
        case three = "Three"
    }
    
    private let tableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = view.bounds
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Menu.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Menu.allCases[indexPath.row].rawValue
        return cell
    }
}
