//
//  ExpandViewController.swift
//  SlideshowApp2
//
//  Created by hidetoshi-m on 2016/11/26.
//  Copyright © 2016年 hidetoshi-m. All rights reserved.
//

import UIKit

class ExpandViewController: UIViewController , UIScrollViewDelegate{

    
    var photonum:Int = 0
    var viewerImg: UIImage!
    
    @IBOutlet weak var ExpandPhotoDisp: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        // 画像を読み込み
//        let myImage:UIImage = UIImage(named: "photo\(globalVariableforwardInt).jpg")!
//        
        // 画面に画像を設定する
        ExpandPhotoDisp.image = viewerImg
//        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // ピンチイン・ピンチアウト時に呼ばれる
    private func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return ExpandPhotoDisp
    }
    
}
