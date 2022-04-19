//
//  ViewController.swift
//  slideshowApp
//
//  Created by 矢野俊作 on 2022/04/08.
//

import UIKit

class ViewController: UIViewController {
    
    // 画像の配列と配列番号の変数
    let pics = ["image1.jpeg", "image2.jpeg", "image3.jpeg"]
    var picsnum = 0
    
    // タイマーとタイマー用の時間のための変数
    var timer: Timer!
    

    // イメージビュー
    @IBOutlet weak var imagepic: UIImageView!
    
    // 進むボタンをタップして次の画像を表示する
    @IBAction func nextButton(_ sender: Any) {
        if pics[picsnum] == pics.last {
            
            picsnum = 0
            
            let name = pics[picsnum]
            imagepic.image = UIImage(named: name)
            
        } else {
            
            picsnum += 1
            
            let name = pics[picsnum]
            imagepic.image = UIImage(named: name)
        }
    }
    
    // 戻るボタンをタップして前の画像を表示する
    @IBAction func backButton(_ sender: Any) {
        if pics[picsnum] == pics.first {
            
            picsnum = pics.endIndex - 1
            
            let name = pics[picsnum]
            imagepic.image = UIImage(named: name)
            
        } else {
            
            picsnum -= 1
            
            let name = pics[picsnum]
            imagepic.image = UIImage(named: name)
        }
    }
    
    // 再生停止ボタン
    @IBOutlet weak var startstopButtonImage: UIButton!
    // 進むボタン
    @IBOutlet weak var nextButtonImage: UIButton!
    // 戻るボタン
    @IBOutlet weak var backButtonImage: UIButton!
    
    
    // 再生ボタンをタップすると自動送りが始まり、2秒毎にスライドさせる
    @IBAction func startstopButton(_ sender: Any) {
        if (timer == nil) {
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            // ボタンのアイコン表示を停止に変える
            let picture = UIImage(systemName: "stop") //停止の画像表示
            startstopButtonImage.setImage(picture, for: .normal)
            
            // 進むボタンと戻るボタンをタップ不可にする
            nextButtonImage.isEnabled = false
            backButtonImage.isEnabled = false
            
        } else {
            timer.invalidate()
            
            timer = nil
            
            // ボタンのアイコン表示を再生に変える
            let picture = UIImage(systemName: "play") //再生の画像表示
            startstopButtonImage.setImage(picture, for: .normal)
            
            // 進むボタンと戻るボタンをタップ可にする
            nextButtonImage.isEnabled = true
            backButtonImage.isEnabled = true
        }
    }
    
    
    @objc func changeImage() {
        if pics[picsnum] == pics.last {
            
            picsnum = 0
            
            let name = pics[picsnum]
            imagepic.image = UIImage(named: name)
            
        } else {
            
            picsnum += 1
            
            let name = pics[picsnum]
            imagepic.image = UIImage(named: name)
        }
    }
    
    // ２つ目の画面の戻るをタップした時に、再生した状態でタップした場合、1つ目の画面に戻りタイマーを再始動させる
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        if (nextButtonImage.isEnabled == false) {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
        }
    }
    
//    @IBAction func tapAction(_ sender: Any) {
//
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            let enlargedImageViewController:EnlargedImageViewController = segue.destination as! EnlargedImageViewController
            
//            let name = pics[picsnum]
            
//            print(name)
            
//            imagepic.image = UIImage(named: name)
//            enlargedImageViewController.x = imagepic.image
//        }
        
//    }
    
    // 1つ目の画像をタップした時に2つ目の画面を表示させる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let enlargedImageViewController:EnlargedImageViewController = segue.destination as! EnlargedImageViewController
        
        // 再生ボタンを押していない状態で画像をタップした場合、タイマーには何もしない
        if (timer == nil) {
            let name = pics[picsnum]
                    
            imagepic.image = UIImage(named: name)
            enlargedImageViewController.x = imagepic.image
        }
        // 再生ボタンを押した状態で画像をタップした場合、タイマーを止める
        else {
            let name = pics[picsnum]
                    
            imagepic.image = UIImage(named: name)
            enlargedImageViewController.x = imagepic.image
            
            timer.invalidate()
            timer = nil
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    
    
}

