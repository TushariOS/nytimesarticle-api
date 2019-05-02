//
//  ViewController.swift
//  SingleAPICalll
//
//  Created by Tushar on 27/04/19.
//  Copyright © 2019 Tushar. All rights reserved.
//

import UIKit
import SVProgressHUD

/// View controller display the nyc time stories data
class ViewController: UIViewController {

    var resulData = [Results]()

    @IBOutlet private weak var tableview: UITableView!
    
    // MARK: - View Controll life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableview()
        apiCall()
    }

    // MARK: -  Private methodes.
    
    /// NYC api call method.
    private func apiCall() {
        SVProgressHUD.show()
        SVProgressHUD.show(withStatus: "In Progress")
        let vm = ViewModel()
        vm.storyAPICall { [weak self] (data, error) in
            DispatchQueue.main.async {
                if let data = data?.results {
                    self?.resulData = data
                    self?.tableview.reloadData()
                }
                SVProgressHUD.dismiss()
            }
        }
    }

    /// Set tableview cell.
    private func setTableview() {
        tableview.rowHeight = 206
        registerCell()
    }
    
    /// Register tableview cell.
    private func registerCell() {
        tableview.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "tableView")
    }
}

// MARK: - UITableview dataSource and delegates methods in extension.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resulData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DataTableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableView") as! DataTableViewCell
        cell.setData(result: resulData[indexPath.row])
        return cell
    }
}
