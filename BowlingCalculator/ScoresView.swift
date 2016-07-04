import UIKit

protocol ScoresViewDelegate: class {
    func getMaxNumberOfFrames() -> Double
}

class ScoresView: UIView {
    
    weak var delegate: ScoresViewDelegate? {
        didSet {
            for index in 1...Int(delegate!.getMaxNumberOfFrames()) {
                let view = ScoreView(index: index)
                addSubview(view)
            }
        }
    }
    
    func updateAllConstraints() {
        guard let numberOfFrames = delegate?.getMaxNumberOfFrames() else {
            return
        }
        
        for view in subviews as! [ScoreView] {
            let index = view.index
            
            view.translatesAutoresizingMaskIntoConstraints = false
            let trail = index == 10 ? trailingAnchor : getView(atIndex: index + 1).leadingAnchor
            
            view.trailingAnchor.constraintEqualToAnchor(trail).active = true
            view.topAnchor.constraintEqualToAnchor(topAnchor).active = true
            view.widthAnchor.constraintEqualToAnchor(widthAnchor, multiplier: CGFloat(1.0 / numberOfFrames)).active = true
            view.heightAnchor.constraintEqualToAnchor(heightAnchor).active = true
            
            view.layer.borderColor = UIColor.blackColor().CGColor
            view.layer.borderWidth = 0.5
        }
        
        setNeedsUpdateConstraints()
    }
    
    private func getView(atIndex index: Int) -> ScoreView {
        return subviews.filter { ($0 as! ScoreView).index == index }.first as! ScoreView
    }
}