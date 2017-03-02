//
//  ViewController.swift
//  Chess
//
//  Created by TTung on 3/1/17.
//  Copyright © 2017 TTung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    var soHang = 8
    var soCot = 8
    var mainViewSize: CGSize!
    var colorWhite = false
    var imageChess: UIImageView!
    var imageChess2:UIImageView!
    
    @IBOutlet var v_view: UIView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewSize = self.v_view.bounds.size
        drawBoard()
        addChess()
      
        

           }
  

    func drawBoard(){
        let space = spaceSize()
        
        for indexHang in 0..<8 {
            for indexCot in 0..<8{
                let lay = CAShapeLayer()
                lay.path = UIBezierPath(roundedRect: CGRect(x: CGFloat(indexHang)*space , y: CGFloat(64) + CGFloat(indexCot)*space , width: space, height: space), cornerRadius: 0).cgPath
                
            if colorWhite == false{
                lay.fillColor = UIColor.black.cgColor
                 colorWhite = true
            }else if colorWhite == true{
                lay.fillColor = UIColor.gray.cgColor
                colorWhite = false
            }
            lay.opacity = 0.7
            view.layer.addSublayer(lay)
            }
            colorWhite = !colorWhite
        }
    }
    func addChess(){
        addChessBlack()
        addChessWhite()
    }
    
    
    func addChessBlack(){
        let space = spaceSize()
        var count = 0
        for indexCot in 0..<2 {
            for indexHang in 0..<8{
                count = count + 1
                
//                var imageChess: UIImageView
                imageChess = UIImageView(frame: CGRect(x: CGFloat(indexHang)*space, y: CGFloat(64) + CGFloat(indexCot)*space , width: space, height: space))

                imageChess.tag = 100 + count
                self.view.addSubview(imageChess)
                
                if imageChess.tag == 101 || imageChess.tag == 108{
                    imageChess.image = UIImage(named: "Rook.png")
                }
                
                else if imageChess.tag == 102 || imageChess.tag == 107{
                    imageChess.image = UIImage(named: "Knight.png")
                }
                
                else if imageChess.tag == 103 || imageChess.tag == 106 {
                    imageChess.image = UIImage(named: "Bishop.png")
                }
                    
                else if imageChess.tag == 104 {
                    imageChess.image = UIImage(named: "Queen.png")
                }
                    
                else if imageChess.tag == 105 {
                    imageChess.image = UIImage(named: "KingYellow.png")

                }
                
                else if imageChess.tag == 109 || imageChess.tag == 110 || imageChess.tag == 111 || imageChess.tag == 112 || imageChess.tag == 113 || imageChess.tag == 114 || imageChess.tag == 115 || imageChess.tag == 116 {
                    imageChess.image = UIImage(named: "Pawn.png")
                }

                let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
                imageChess.isUserInteractionEnabled = true
                imageChess.addGestureRecognizer(gestureRecognizer)
                
                }
            }
        }
    
    func addChessWhite(){
        let space = spaceSize()
        var count = 0
        for indexCot in 6..<8 {
            for indexHang in 0..<8{
                count = count + 1
                
                imageChess2 = UIImageView(frame: CGRect(x: CGFloat(indexHang)*space, y: CGFloat(64) + CGFloat(indexCot)*space , width: space, height: space))
                
                imageChess2.tag = 150 + count
                self.view.addSubview(imageChess2)
                
                if imageChess2.tag == 159 || imageChess2.tag == 166{
                    imageChess2.image = UIImage(named: "Rook.png")
                }
                    
                else if imageChess2.tag == 160 || imageChess2.tag == 165{
                    imageChess2.image = UIImage(named: "Knight.png")
                }
                    
                else if imageChess2.tag == 161 || imageChess2.tag == 164 {
                    imageChess2.image = UIImage(named: "Bishop.png")
                }
                    
                else if imageChess2.tag == 162 {
                    imageChess2.image = UIImage(named: "Queen.png")
                }
                    
                else if imageChess2.tag == 163 {
                    imageChess2.image = UIImage(named: "KingYellow.png")
                
                }
                    
                else if imageChess2.tag == 151 || imageChess2.tag == 152 || imageChess2.tag == 153 || imageChess2.tag == 154 || imageChess2.tag == 155 || imageChess2.tag == 156 || imageChess2.tag == 157 || imageChess2.tag == 158 {
                    imageChess2.image = UIImage(named: "Pawn.png")
                }
                
                let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
                imageChess2.isUserInteractionEnabled = true
                imageChess2.addGestureRecognizer(gestureRecognizer)
                
            }
        }

    }
    
     func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            
            let translation = gestureRecognizer.translation(in: self.view)
            // note: 'view' is optional and need to be unwrapped
            gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPoint.zero, in: self.view)
        }
    }
    
    


    func spaceSize() -> CGFloat{
        let space = (self.mainViewSize.width)/CGFloat(8)
        return space
    }
}




