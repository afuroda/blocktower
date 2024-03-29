//
//  GameScene.swift
//  block
//
//  Created by 山口航輝 on 2018/04/05.
//  Copyright © 2018年 koki.yamaguchi. All rights reserved.
//

import UIKit
import SpriteKit

class GameScene: SKScene ,SKPhysicsContactDelegate{
    
    var plateNode:SKNode!
    
    var blockNode1:SKNode!
    var block1Sprite=SKSpriteNode()
    var blockPositionx=CGFloat()
    
    
    //ブロックの重力作用用のフラグ
    var gravityFlag:Bool!

    
    //シーンが呼び出された時に呼ばれるメソッド
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(red: 1, green: 1, blue: 0.67, alpha: 1)
        
        physicsWorld.gravity=CGVector(dx: 0, dy: -4.0)
        
        //blockPositionxの初期化
        blockPositionx=0
        
        blockNode1=SKNode()
        addChild(blockNode1)
        
        
        plateNode=SKNode()
        addChild(plateNode)
        
        makePlate()
        
    }
    
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        makeBlock1()
        for touch in touches{
            let beganTouches = touch.location(in: self)
            block1Sprite.position=CGPoint(x: beganTouches.x , y: self.frame.size.height-self.frame.size.height/10)
            print("touchesBeganの時のmakeblockNode:\(block1Sprite.position.x)")

        }
    }
    
   
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
           
            let newPosition = touch.location(in: self)
            
            let oldPosition = touch.previousLocation(in: self)
            let xTranslation = newPosition.x - oldPosition.x
            
            
            blockPositionx=block1Sprite.position.x
            blockPositionx += xTranslation
            
            //blockNodeを動かすアニメーション
            let blockAnimation=SKAction.moveTo(x: blockPositionx, duration: 0.0)
            block1Sprite.run(blockAnimation, withKey: "block anime")
        }
       
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
blockNode1.removeAllChildren()
        
       downBlock1()
    
        
    }
    func makeBlock1(){
        
        //SpriteNodeの生成
        block1Sprite=SKSpriteNode(color: UIColor.green, size: CGSize(width: self.frame.size.width/7, height: self.frame.size.height/10))
        
        print("makeBlockの時のPositionx:\(blockPositionx)")
        //ノードの表示箇所
        block1Sprite.position=CGPoint(x: self.frame.size.width/2 , y: self.frame.size.height-self.frame.size.height/10)
        
        
        

        blockNode1.addChild(block1Sprite)
      

        
    }
    
    func downBlock1(){
        //SpriteNodeの生成
        let downblock1Sprite=SKSpriteNode(color: UIColor.green, size: CGSize(width: self.frame.size.width/7, height: self.frame.size.height/10))
        
        print("downBlock1の時のblockPositionx:\(blockPositionx)")
        if blockPositionx==0{
            print("blockPositionx=0")
            blockPositionx=blockNode1.position.x
        }

        //ノードの表示箇所
        downblock1Sprite.position=CGPoint(x: block1Sprite.position.x , y: block1Sprite.position.y)
        
        
        
        //物理演算の追加
        downblock1Sprite.physicsBody=SKPhysicsBody(rectangleOf: downblock1Sprite.size)
        
        addChild(downblock1Sprite)
        print("downBlock1の時のdownblock1SpritePositionx:\(downblock1Sprite.position.x)")
    }
    
    func makePlate(){
        let plateSprite=SKSpriteNode(color: UIColor.blue, size: CGSize(width: self.frame.size.width/2, height: self.frame.size.height/13))
        
        plateSprite.position=CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/10)
        plateSprite.physicsBody=SKPhysicsBody(rectangleOf: plateSprite.size)
        //衝突時に動かないようにする
        plateSprite.physicsBody?.isDynamic=false
        addChild(plateSprite)
    }
}
