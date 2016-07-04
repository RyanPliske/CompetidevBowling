import UIKit

class ViewController: UIViewController, ScoresViewDelegate {
    
    @IBOutlet private weak var scoresView: ScoresView! {
        didSet {
            scoresView.delegate = self
        }
    }
    
    private var model: BowlingModel
    
    required init?(coder aDecoder: NSCoder) {
        self.model = BowlingModel()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoresView.updateAllConstraints()
    }
    
    // MARK: - ScoresViewDelegate
    
    func getMaxNumberOfFrames() -> Double {
        return model.getMaxNumberOfFrames()
    }

}