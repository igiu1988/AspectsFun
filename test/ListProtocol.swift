//
//  TableViewProtocol.swift
//  test
//
//  Created by wangyang on 16/3/15.
//  Copyright © 2016年 北京更美互动信息科技有限公司. All rights reserved.
//

import Foundation

// 任何业务都可以挂上这个协议，只需要一个继承于BaseViewModel的viewModel就可以了
protocol ListProtocol: UITableViewDelegate {
    var tableView: UITableView! {get set}
    // id <UITableViewDelegate>
//    func addTableView(viewModel viewModel: BaseViewModel?, tableHelper: protocol<UITableViewDelegate, UITableViewDataSource>, fetchDataImmediately immediately: Bool)
    func addTableView(viewModel viewModel: BaseViewModel?, fetchDataImmediately immediately: Bool)
    func fetchData(viewModel: BaseViewModel)

    func updateOtherUIData()
}

extension ListProtocol where Self: BaseViewController {

    func addTableView(viewModel viewModel: BaseViewModel?, fetchDataImmediately immediately: Bool) {
        tableView = UITableView(frame: self.view.bounds, style: .Plain)

        self.view.addSubview(tableView)
        if immediately {
            self.fetchData(viewModel!)
        }
    }

    func fetchData(viewModel: BaseViewModel) {
        self.showLoading()
        viewModel.fetchRemoteData() { [unowned self] () -> Void in
            print("FetchRemoteDataFinish")
            self.updateOtherUIData()
            self.tableView.reloadData()
            self.hideLoading()
        }
    }

    func updateOtherUIData() {
        print("default updateOtherUIData")
    }
}


