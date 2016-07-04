import UIKit

class ScoreView: UIView {
    
    let index: Int
    
    init(index: Int) {
        self.index = index
        super.init(frame: CGRectZero)
        for _ in 1...2 {
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}