//
//  BaseViewController.swift
//  test
//
//  Created by wangyang on 16/3/16.
//  Copyright © 2016年 北京更美互动信息科技有限公司. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

// 或者写在父类里也是可以的
extension BaseViewController {

    func showLoading() {
        print("showLoading")
    }

    func hideLoading() {
        print("hideLoading")
    }
}
