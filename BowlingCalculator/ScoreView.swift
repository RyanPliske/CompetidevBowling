import UIKit

class ScoreView: UIView {
    
    let index: Int
    
    init(index: Int) {
        self.index = index
        super.init(frame: CGRectZero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}