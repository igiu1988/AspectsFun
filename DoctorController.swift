//
//  BaseListController.swift
//  test
//
//  Created by wangyang on 16/3/14.
//  Copyright © 2016年 北京更美互动信息科技有限公司. All rights reserved.
//

import UIKit

class DoctorController: BaseViewController, ListProtocol {

    // 协议扩展不能实例化属性，所以必须在这里声明一下。另外这样很好啊，我们一眼清楚这个类都有什么东西
    // property from protocol
    var tableView: UITableView!

    let viewModel = DoctorViewModel()
    var listHelper: DoctorListHelper!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addTableView(viewModel:viewModel, fetchDataImmediately:false)

        listHelper = DoctorListHelper(controller: self, table:tableView, viewModel: viewModel)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchData(viewModel)
    }

}

// 这样写的作用就是可以复用
class DoctorListHelper: NSObject, UITableViewDelegate, UITableViewDataSource {
    weak var owner: UIViewController!
    weak var ownerViewModel: DoctorViewModel!

    convenience init(controller: UIViewController, table: UITableView, viewModel: DoctorViewModel) {
        self.init()
        owner = controller
        ownerViewModel = viewModel

        table.delegate = self;
        table.dataSource = self;
        table.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
    }

     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("DoctorController")
        owner!.dismissViewControllerAnimated(true, completion: nil)
    }

     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ownerViewModel!.list.count
    };

     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = ownerViewModel!.nameAtIndexPath(indexPath)
        return cell
    }
}

//class BaseListHelper: NSObject, UITableViewDelegate, UITableViewDataSource {
//
//    convenience init(controller: UIViewController, table: UITableView, viewModel: DoctorViewModel) {
//        self.init()
//        owner = controller
//        ownerViewModel = viewModel
//
//        table.delegate = self;
//        table.dataSource = self;
//        table.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
//    }
//
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//
//    }
//
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0;
//    };
//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
//        return cell
//    }
//}


class DoctorViewModel: BaseViewModel {

    override init() {
        super.init()
        url = "DoctorViewModelUrl"
    }
    func nameAtIndexPath(indexPath: NSIndexPath) -> String {

        return self.list[indexPath.row] as! String 
    }
}
