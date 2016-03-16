//
//  SubController.swift
//  test
//
//  Created by wangyang on 16/3/14.
//  Copyright © 2016年 北京更美互动信息科技有限公司. All rights reserved.
//

import UIKit


class SearchDoctorController: BaseViewController, ListProtocol {

    // 协议扩展不能实例化属性，所以必须在这里声明一下。另外这样很好啊，我们一眼清楚这个类都有什么东西
    // property from protocol
    var tableView: UITableView!

    let viewModel = SearchDoctorViewModel()
    var listHelper: SearchDoctorListHelper!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addTableView(viewModel:viewModel, fetchDataImmediately:true)
        listHelper = SearchDoctorListHelper(controller: self, table: tableView, viewModel: viewModel)
    }

    func updateOtherUIData() {
        print("updateOtherUIData")
    }
}

// 这样写的作用就是可以复用
class SearchDoctorListHelper: DoctorListHelper {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("sub controller")
        self.owner!.dismissViewControllerAnimated(true, completion: nil)
    }
}

class SearchDoctorViewModel : DoctorViewModel
{
    override init() {
        super.init()
        url = "SearchDoctorViewModelUrl"
    }

    override func buildData(json: [String : AnyObject]) {
        self.list = ["1", "2", "3", "3", "5", "6"]
    }
}
