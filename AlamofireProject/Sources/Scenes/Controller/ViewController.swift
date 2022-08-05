//
//  ViewController.swift
//  AlamofireProject
//
//  Created by Федор Донсков on 04.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var myTableView = UITableView()
    private var array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView()
    }
    
    func createTableView() {
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(myTableView)
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath)
        
        let number = array[indexPath.row]
        
        cell.textLabel?.text = number
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Comics"
    }
}

