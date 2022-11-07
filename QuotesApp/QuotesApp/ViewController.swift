//
//  ViewController.swift
//  QuotesApp
//
//  Created by amtul imrana on 07/11/22.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    var jsonResult : [someData] = []
    
    func fetchData() {
        jsonResult = jsonExtractor.shared.fecthJsonData()
    }
    
    //MARK: Tableview
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonResult.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell" , for: indexPath)
        let data = jsonResult[indexPath.row].author
        guard let data = data else {
            return cell
        }
        cell.textLabel?.text = "\(data)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let quote = jsonResult[indexPath.row].quote ?? " "
        let authorName = jsonResult[indexPath.row].author ?? ""
        let newVC = QuotesViewController(quote: quote, authorName: authorName)
       navigationController?.pushViewController(newVC, animated: true)
    }
    func configView(){
        view.addSubview(tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.topAnchor.constraint(equalTo:  view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo:  view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:  view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:  view.bottomAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configView()
        fetchData()
        self.title = "Authors"
    }
    
    
}

