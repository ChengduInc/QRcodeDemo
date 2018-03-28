//
//  CreateQRcodeController.swift
//  QRcodeDemo
//
//  Created by Apple on 2018/3/22.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import CoreImage

class CreateQRcodeController: UIViewController {

    // MARK : IBOutlet控件
    @IBOutlet weak var qrCodeImageView: UIImageView!
    @IBOutlet weak var inputTextFild: UITextField!
    
    // MARK : 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func createButton(_ sender: Any) {
        
        // 创建普通二维码方法
        createDefaultQRcode()
      
    }
    
    @IBAction func createCustomButton(_ sender: Any) {
        
        // 创建自定义二维码方法
        createCustomQRcode()
    }
    
}

extension CreateQRcodeController {
    
    // 创建普通二维码
    fileprivate func createDefaultQRcode() {
        
        let str = inputTextFild.text
        
        // 1. 创建二维码滤镜
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        // 2. 恢复滤镜默认值
        filter?.setDefaults()
        
        // 2. 将字符串转换成NSData
        let data = str?.data(using: String.Encoding.utf8)
        
        // 3. 设置滤镜输入数据
        filter?.setValue( data, forKey: "inputMessage")
        
        // 3.1 设置二维码纠错率
        filter?.setValue("H", forKey: "inputCorrectionLevel")
        
        // 4. 从二维码滤镜里获取结果图片,并处理成高清图像
        // 4.1 从二维码滤镜里获取结果图片
        guard var image = filter?.outputImage else {
            return
        }
        // 4.2 处理成高清图像
        let transform = CGAffineTransform(scaleX: 20, y: 20)
        image = image.transformed(by: transform)
        
        // 5. CIImage转换成UIImage
        let resultImage = UIImage(ciImage: image)
        
        // 6. 显示图片
        qrCodeImageView.image = resultImage
        
    }
    
    // 创建自定义二维码
    fileprivate func createCustomQRcode() {
        
        
        let str = inputTextFild.text
        
        // 1. 创建二维码滤镜
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        // 2. 恢复滤镜默认值
        filter?.setDefaults()
        
        // 2. 将字符串转换成NSData
        let data = str?.data(using: String.Encoding.utf8)
        
        // 3. 设置滤镜输入数据
        filter?.setValue( data, forKey: "inputMessage")
        
        // 3.1 设置二维码纠错率
        filter?.setValue("H", forKey: "inputCorrectionLevel")
        
        // 4. 从二维码滤镜里获取结果图片,并处理成高清图像
        // 4.1 从二维码滤镜里获取结果图片
        guard var image = filter?.outputImage else {
            return
        }
        // 4.2 处理成高清图像
        let transform = CGAffineTransform(scaleX: 20, y: 20)
        image = image.transformed(by: transform)
        
        // 5. CIImage转换成UIImage
        var resultImage = UIImage(ciImage: image)
        
        // 5.1 绘制中心图片
        let centerImage = UIImage(named: "头像")
        resultImage = newImage(sourceImage: resultImage, centerImage: centerImage!)
        
        // 6. 显示图片
        qrCodeImageView.image = resultImage
        
    }
    
    // 绘制中心图片方法
    fileprivate func newImage(sourceImage:UIImage,centerImage:UIImage) -> UIImage {
        
        // 1. 开启图形上下文
        let size = sourceImage.size
        UIGraphicsBeginImageContext(size)
        
        // 2. 绘制大图片
        sourceImage.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        // 3. 绘制小图片
        let width : CGFloat = 80
        let height : CGFloat = 80
        let x : CGFloat = (size.width - width) * 0.5
        let y : CGFloat = (size.height - height) * 0.5
        centerImage.draw(in: CGRect(x: x, y: y, width: width, height: height))
        
        // 4. 取出结果图片
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // 5. 关闭图形上下文
        UIGraphicsEndImageContext()
        
        // 6. 返回结果
        return resultImage!
    }
    
}
