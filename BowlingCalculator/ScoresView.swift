import UIKit

class ScoresView: UIView {
    
    private let widthMultiplier: CGFloat = 1 / 10
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeViews()
    }
    
    func updateViewConstraints() {
        for view in subviews as! [ScoreView] {
            let index = view.index

            view.translatesAutoresizingMaskIntoConstraints = false
            let trail = index == 10 ? trailingAnchor : getView(atIndex: index + 1).leadingAnchor
            
            view.trailingAnchor.constraintEqualToAnchor(trail).active = true
            view.topAnchor.constraintEqualToAnchor(topAnchor).active = true
            view.widthAnchor.constraintEqualToAnchor(widthAnchor, multiplier: widthMultiplier).active = true
            view.heightAnchor.constraintEqualToAnchor(heightAnchor).active = true
            
            view.layer.borderColor = UIColor.blackColor().CGColor
            view.layer.borderWidth = 0.5        }
        
        setNeedsUpdateConstraints()
    }
    
    private func getView(atIndex index: Int) -> ScoreView {
        return subviews.filter { ($0 as! ScoreView).index == index }.first as! ScoreView
    }
    
    private func initializeViews() {
        for index in 1...10 {
            let view = ScoreView(index: index)
            addSubview(view)
        }
        clipsToBounds = true
    }
}