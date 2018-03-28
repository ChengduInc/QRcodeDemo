//
//  ExtractQRcodeController.swift
//  QRcodeDemo
//
//  Created by Apple on 2018/3/22.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit

class ExtractQRcodeController: UIViewController {

     // MARK : IBOutlet控件
    @IBOutlet weak var sourceImaeh: UIImageView!
    
    // MARK : 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func ExtractQRcodeButton(_ sender: Any) {
        
        extractQRcode()
        
    }

}

extension ExtractQRcodeController {
    
    // 识别图片二维码方法
    fileprivate func extractQRcode() {
        // 1. 获取需要识别的二维码
        // 2. 开始识别
        // 2.1 创建一个二维码探测器
        // 2.2 直接探测二维码
        
    }
}
