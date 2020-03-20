

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func doLayoutUpdates() {

    }

    func showProgress(){
        let progressView = CircularProgressView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width:self.view.frame.width, height:  self.view.frame.height)))
        progressView.center = self.view.center
        progressView.animateProgressView()
        progressView.tag = TAG_PROGRESS_VIEW
        self.view.addSubview(progressView)
    }
 
    func hideProgress(){
        if let progressView = self.view.viewWithTag(TAG_PROGRESS_VIEW){
            progressView.removeFromSuperview()
        }
    }
}
