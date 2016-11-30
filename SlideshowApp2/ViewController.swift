//
//  ViewController.swift
//  SlideshowApp2
//
//  Created by hidetoshi-m on 2016/11/19.
//  Copyright © 2016年 hidetoshi-m. All rights reserved.
//

import UIKit

var globalVariableforwardInt:Int = 1
var globalVariableSlideshowFlag:Bool = false

class ViewController: UIViewController {

    @IBOutlet weak var dispImage: UIImageView!
    @IBOutlet weak var btnSUSUMU: UIButton!
    @IBOutlet weak var BtnMODORU: UIButton!
    @IBOutlet weak var BtnSAISEITEISHI: UIButton!
  
    //タイマーの使用宣言
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dispImage.image = UIImage(named: "photo1.jpg")!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let ExpandViewController:ExpandViewController = segue.destination as! ExpandViewController

        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        ExpandViewController.photonum = globalVariableforwardInt
        
        // 写真Viewerに画像データを渡す
        if let photoViewCtrl: ExpandViewController = segue.destination as? ExpandViewController {
            photoViewCtrl.viewerImg = dispImage.image
        }
    }
    
    
    //進むボタンの処理
    @IBAction func btnForward(_ sender: Any) {
        
        dispforward()
        
    }

    //戻るボタンの処理
    @IBAction func btnBack(_ sender: Any) {
        
        dispback()
    }
    
    //スライドショーボタンの処理
    @IBAction func btnSlideshow(_ sender: Any) {
        
        //スライドショーのON／OFF状態をチェックし、各種処理

        //スライドショーが既に開始状態の場合
        if globalVariableSlideshowFlag == true {

            //フラグをOFFに、進む・戻るボタンの有効化・タイマー無効
            globalVariableSlideshowFlag = false
            BtnMODORU.isEnabled = true
            btnSUSUMU.isEnabled = true
            BtnSAISEITEISHI.setTitle("再生", for:.normal)
            timer?.invalidate()
            
            //スライドショーが未開始状態の場合
        } else {
            //フラグをONに、進む・戻るボタンの無効化・タイマー有効
            globalVariableSlideshowFlag = true
            BtnMODORU.isEnabled = false
            btnSUSUMU.isEnabled = false
            BtnSAISEITEISHI.setTitle("停止", for:.normal)
            // タイマーを開始
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
            
        }
    }
    
    //2画面目から戻るときの処理
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
    //タイマー時の処理関数
    func update(tm: Timer) {
        
        //画像表示
        dispforward()
    }
    
    //写真番号を進める方向への表示関数
    func dispforward(){
 
        //画像の番号をプラス
        globalVariableforwardInt = globalVariableforwardInt+1

        //最後の画像の場合、一枚目にする
        if globalVariableforwardInt > 4 {
            globalVariableforwardInt = 1
        }
        
        // 画像を読み込み
        let myImage:UIImage = UIImage(named: "photo\(globalVariableforwardInt).jpg")!
        
        // 画面に画像を設定する
        dispImage.image = myImage

    }
    
    //写真番号を戻る方向への表示関数
    func dispback(){
        
        //画像の番号をマイナス
        globalVariableforwardInt = globalVariableforwardInt-1
        
        //一枚目の画像の場合、最後の画像にする
        if globalVariableforwardInt < 1 {
            globalVariableforwardInt = 4
        }
        
        // 画像を読み込み
        let myImage:UIImage = UIImage(named: "photo\(globalVariableforwardInt).jpg")!
        
        // 画面に画像を設定する
        dispImage.image = myImage
        
    }
}

