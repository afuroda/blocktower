//
//  ViewController.swift
//  block
//
//  Created by 山口航輝 on 2018/04/05.
//  Copyright © 2018年 koki.yamaguchi. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // SKViewに型を変換する
        let skView = self.view as! SKView
        // ビューと同じサイズでシーンを作成する
        let scene = GameScene(size:skView.frame.size)
        // ビューにシーンを表示する
        skView.presentScene(scene)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

