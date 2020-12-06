//
//  BasePaginationViewController.swift
//  ExampleProject
//
//  Created by Sergio Castillo on 04/12/2020.
//

import UIKit

protocol BasePaginationViewPresenter {
    func setup(_ viewModels: [Any])
    func hidePTR()
    func refresh()
    func showError(errorMessage: String)
}

class BasePaginationViewController<ItemViewModel: BaseViewModel<Model>, Model, BasicTableViewCell: BasePaginationTableViewCell<ItemViewModel>>: UITableViewController, BasePaginationViewPresenter {

    var viewModels: [ItemViewModel] = []
    var presenter: BasePaginationPresenterView?
    var ptr: Bool = false

    override func viewDidLoad() {
        let refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        setTableViewFooter()
    }

    func setTableViewFooter() {
        tableView.tableFooterView = UIView()
    }

    override func viewWillAppear(_ animated: Bool) {
        refresh()
    }

    @objc private func refreshData(_ sender: Any) {
        refresh()
    }

    func hidePTR() {
        tableView.refreshControl?.endRefreshing()
    }

    func refresh() {
        ptr = true
        presenter?.fetch(ptr: ptr)
    }

    func setup(_ viewModels: [Any]) {
        if viewModels is [ItemViewModel] {
            if ptr {
                self.viewModels = viewModels.map { $0 as! ItemViewModel }
                ptr = false
            } else {
                self.viewModels.append(contentsOf: viewModels.map { $0 as! ItemViewModel })
            }
            tableView.reloadData()
            presenter?.allItemsLoaded()
        }
    }

    func showError(errorMessage: String) {
        showErrorAlert(message: errorMessage)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter?.itemSelected(position: indexPath.row)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasicTableViewCell.reuseID, for: indexPath) as! BasicTableViewCell
        cell.bind(viewModels[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 4
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
           presenter?.loadMore()
        }
    }
}
