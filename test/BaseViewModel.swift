//
//  BaseViewModel.swift
//  test
//
//  Created by wangyang on 16/3/16.
//  Copyright © 2016年 北京更美互动信息科技有限公司. All rights reserved.
//

import Foundation

typealias FetchRemoteDataFinish = () -> ()
class BaseViewModel {

    var url = ""
    var fetchDataErrorMsg = ""
    var fetchDataNilMsg = ""
    // 专用于数组
    var list:[AnyObject] = [AnyObject]()
    // 用于存放整个的viewObject
    var data = NSObject()
    var parameters = [String: AnyObject]()

    init() {

    }

    func buildParameters(){

    }

    // 如果使用监听模式，那还需要一个就为了监听才加上的变量。其实不光我一个人觉得不好，其他两人也觉得怪，你得说明我们
    func fetchRemoteData(fetchFinish: FetchRemoteDataFinish) {
        // fetch data with url, HTTPMethod, params, finishBlock

        // in finishBlock, call methods below
        buildData([:])
        fetchFinish()
    }

    func buildData(json: [String : AnyObject]) {
        self.list = ["1", "2", "3", "3", "5", "6", "7", "8", "9"]
    }
}