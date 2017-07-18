
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fileImageView: UIView!
    @IBOutlet weak var closeButton: UIBarButtonItem!
    
    var fileViewOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPanGesture(view: fileImageView)
        fileViewOrigin = fileImageView.frame.origin
        view.bringSubview(toFront: fileImageView)
    }
    
    func addPanGesture(view: UIView) {
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    // Refactor
    func handlePan(sender: UIPanGestureRecognizer) {
        
        let fileView = sender.view!
        
        switch sender.state {
            
        case .began, .changed:
            moveViewWithPan(view: fileView, sender: sender)

        case .ended:
            
                returnViewToOrigin(view: fileView)
            
            
        default:
            break
        }
    }
    
    
    func moveViewWithPan(view: UIView, sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        
        view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    
    func returnViewToOrigin(view: UIView) {
        
        UIView.animate(withDuration: 0.3, animations: {
            view.frame.origin = self.fileViewOrigin
        })
    }
    
       }


