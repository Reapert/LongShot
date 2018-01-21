//
//  ViewController.swift
//  LongShotApp
//
//  Created by Brandon on 2018-01-07.
//  Copyright © 2018 XIO. All rights reserved.
//

import UIKit
import LongShot

class ViewController: UIViewController, UINavigationBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let promise = Promise<Int> { (resolve, reject) in
            
        }
        
        promise.then(DispatchQueue.main, { image in
            
        }, { error in
            
        })
        
        promise.then({ image in
            
            print(image)
            
        }).catch { (error) in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func createCustomNavigation() {
        let navigationBar = UINavigationBar()
        self.view.addSubview(navigationBar)
        NSLayoutConstraint.activate([
            navigationBar.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            navigationBar.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            navigationBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
            ])
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.delegate = self
        
        let item = UINavigationItem(title: "Custom Navigation")
        let img = makeChevron(thickness: 3.0, size: CGSize(width: 22.0, height: 44.0), colour: nil)!
        let barButton = UIBarButtonItem(image: img, style: .done, target: nil, action: nil)
        item.leftBarButtonItems = [barButton]
        
        navigationBar.setItems([item], animated: true)
    }
    
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
    func makeChevron(thickness: CGFloat, size: CGSize, colour: UIColor? = nil) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let ctx = UIGraphicsGetCurrentContext()
        
        
        let padding: CGFloat = 0.20
        let path = UIBezierPath()
        path.move(to: CGPoint(x: padding + 0.5, y: 0.773))
        path.addLine(to: CGPoint(x: padding + 0.0, y: 0.5))
        path.addLine(to: CGPoint(x: padding + 0.5, y: 0.227))
        path.apply(CGAffineTransform(scaleX: size.width, y: size.height))
        
        ctx?.setStrokeColor(colour?.cgColor ?? UIColor.white.cgColor)
        ctx?.addPath(path.cgPath)
        ctx?.setLineWidth(thickness)
        ctx?.setLineJoin(.round)
        ctx?.strokePath()
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return colour != nil ? img?.withRenderingMode(.alwaysOriginal) : img
    }

    func test() {
        let blocky: @convention(block) (Int, NSDictionary) -> Void = {(arg, arg2) in
            print("BLOCK \(arg) - \(arg2)")
        }
        
        let function = Function<Void>(blocky, args: 100, ["A": "B", "B": 1] as AnyObject)
        try! function.execute()
    }
}

