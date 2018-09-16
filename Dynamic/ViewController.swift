//
//  ViewController.swift
//  Dynamic
//
//  Created by Citizen on 9/16/18.
//  Copyright © 2018 Citizen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var squareView = UIView()
    var squareViewAnnchorView = UIView()
    var anchorView = UIView()
    var animator = UIDynamicAnimator()
    var atachmentBehavior: UIAttachmentBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSquare()
        createGestureRecognizer()
        createAnchorView()
        createanimationAndBehavior()
    }
    
    func createSquare() {
        squareView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        squareView.backgroundColor = UIColor.green
        squareView.center = self.view.center
        squareViewAnnchorView.frame = CGRect(x: 80, y: 0, width: 20, height: 20)
        squareViewAnnchorView.backgroundColor = UIColor.blue
        squareView.addSubview(squareViewAnnchorView)
        self.view.addSubview(squareView)
    }
    
    func createAnchorView() {
        anchorView.frame = CGRect(x: 120, y: 120, width: 20, height: 20)
        anchorView.backgroundColor = UIColor.red
        self.view.addSubview(anchorView)
    }
    
    func createGestureRecognizer() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(paramPan:)))
        self.view.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    func createanimationAndBehavior(){
        animator = UIDynamicAnimator(referenceView: view)
        let colision = UICollisionBehavior(items: [squareView])
        colision.translatesReferenceBoundsIntoBoundary = true
        atachmentBehavior = UIAttachmentBehavior(item: squareView, attachedToAnchor: anchorView.center)
        animator.addBehavior(colision)
        animator.addBehavior(atachmentBehavior!)
    }
    
    @objc func handlePan(paramPan: UIPanGestureRecognizer) {
        let tapPoint = paramPan.location(in: self.view)
        print(tapPoint)
        atachmentBehavior?.anchorPoint = tapPoint
        anchorView.center = tapPoint
    }
    
}

