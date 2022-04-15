//
//  ViewController.swift
//  slideshowApp
//
//  Created by 矢野俊作 on 2022/04/08.
//

import UIKit

class ViewController: UIViewController {
    
    let pics = ["Image-1", "Image-2", "Image-3"]
    var picsnum = 0

    
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
    
    //戻るボタンをタップして前の画像を表示する
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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    
    
}

