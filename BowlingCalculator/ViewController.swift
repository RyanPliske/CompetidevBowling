import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var framesView: FramesView!
    @IBOutlet weak var scoresView: ScoresView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoresView.updateScoreConstraints()
    }

}

