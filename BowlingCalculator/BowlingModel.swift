enum UserError: String {
    case ScoreTooLarge = "Score Out of Range!"
}

protocol BowlingModelDelegate: class {
    func displayMessage(message: String)
}

final class BowlingModel {
    
    weak var delegate: BowlingModelDelegate?
    var frames = [Frame]()
    var totalScore = 0
    let totalNumberOfFrames = 10.0
    
    func addScore(score: Int) {
        
        if score > Frame.scoreLimit || score < 0 {
            delegate?.displayMessage(UserError.ScoreTooLarge.rawValue)
            return
        }
        
        if frames.isEmpty {
            frames.append(Frame(score: score))
            return
        }
        
        let currentFrame = frames.last!
        
        if currentFrame.score2 == nil {
            if currentFrame.scoreLimitReached {
                frames.append(Frame(score: score))
            } else {
                currentFrame.score2 = score
            }
            updateTotalScore(currentFrame)
        } else {
            frames.append(Frame(score: score))
        }
    }
    
    func getMaxNumberOfFrames() -> Double {
        return totalNumberOfFrames
    }
    
    private func updateTotalScore(completedFrame: Frame) {
        if let score1 = completedFrame.score1 {
            totalScore += score1
        }
        
        if let score2 = completedFrame.score2 {
            totalScore += score2
        }
    }
}

class Frame {
    static let scoreLimit = 10

    var score1: Int?
    var score2: Int?
    
    init(score: Int) {
        self.score1 = score
    }
    
    var scoreLimitReached: Bool {
        var totalScore = 0
        
        if let score1 = score1 {
            totalScore += score1
        }
        
        if let score2 = score2 {
            totalScore += score2
        }
        
        if totalScore >= 10 {
            return true
        } else {
            return false
        }
    }
}