//
//  MenuViewController.swift
//  progry
//
//  Created by Kevin Duenas on 29/05/22.
//

import UIKit
import CoreMotion

class MenuViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnMyPrograms: UIButton!
    @IBOutlet weak var btnExamples: UIButton!
    @IBOutlet weak var btnCredits: UIButton!
    @IBOutlet weak var lblVersion: UILabel!
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var motion: CMMotionManager!
    var queue: OperationQueue!
    var showExamples  = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGravity()
    }
    

    func setupGravity(){
        queue = OperationQueue.current
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior(items: [lblTitle, btnMyPrograms, btnExamples, btnCredits, lblVersion])
        motion = CMMotionManager()
        animator.addBehavior(gravity)
        let collision = UICollisionBehavior(items: [lblTitle, btnMyPrograms, btnExamples, btnCredits, lblVersion])
        collision.addBoundary(withIdentifier: "borders" as NSCopying, for: UIBezierPath(rect: self.view.frame))
        animator.addBehavior(collision)
        motion.startDeviceMotionUpdates(to: queue) { motion, error in
            guard let motion = motion else { return }
            let grav: CMAcceleration = motion.gravity
            let x = CGFloat(grav.x)
            let y = CGFloat(grav.y)
            var p = CGPoint(x: x, y: y)
            if let orientation = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.windowScene?.interfaceOrientation {
                if orientation == .landscapeLeft {
                    let t = p.x
                    p.x = 0 - p.y
                    p.y = t
                } else if orientation == .landscapeRight {
                    let t = p.x
                    p.x = p.y
                    p.y = 0 - t
                } else if orientation == .portraitUpsideDown {
                    p.x *= -1
                    p.y *= -1
                }
            }
            let v = CGVector(dx: p.x, dy: 0 - p.y)
            self.gravity.gravityDirection = v
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as! UINavigationController
        let vc = nav.topViewController as! ProgramsViewController
        let senderBtn = sender as! UIButton
        
        if senderBtn == btnMyPrograms {
            vc.showExamples = false
        }else if senderBtn == btnExamples {
            vc.showExamples = true
        }
        
        
    }

}
