import UIKit

class ScoresView: UIView {
    
    let widthOfTenthFrame = ScoresView.widthOfAFrame * 3
    
    let tenthScoreView = ScoreView(frameIndex: 10)
    
    static var widthOfAFrame: CGFloat {
        return UIScreen.mainScreen().bounds.width / 21
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(tenthScoreView)
    }
    
    func updateScoreConstraints() {
        tenthScoreView.backgroundColor = UIColor.greenColor()
        tenthScoreView.translatesAutoresizingMaskIntoConstraints = false
        tenthScoreView.trailingAnchor.constraintEqualToAnchor(trailingAnchor).active = true
        tenthScoreView.topAnchor.constraintEqualToAnchor(topAnchor).active = true
        tenthScoreView.widthAnchor.constraintEqualToConstant(widthOfTenthFrame).active = true
        tenthScoreView.heightAnchor.constraintEqualToAnchor(heightAnchor).active = true
        
        setNeedsUpdateConstraints()
    }
    
}

class ScoreView: UIView {
    
    let frameIndex: Int
    
    init(frameIndex: Int) {
        self.frameIndex = frameIndex
        super.init(frame: CGRectZero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}