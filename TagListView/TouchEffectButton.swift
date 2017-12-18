import UIKit

open class TouchEffectButton: UIButton {
    override open var isEnabled: Bool {
        didSet {
            if !isEnabled {
                self.alpha = 0.2
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup() {
        self.addTarget(self, action: #selector(touchDragEnter), for: .touchDragEnter)
        self.addTarget(self, action: #selector(touchDragExit), for: .touchDragExit)
        self.addTarget(self, action: #selector(touchDown), for: .touchDown)
        self.addTarget(self, action: #selector(touchCancel), for: .touchCancel)
        self.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        self.addTarget(self, action: #selector(touchUpOutside), for: .touchUpOutside)
    }
    @objc private func touchDragEnter() {
        self.onTouchIn(.touchDragEnter)
    }
    @objc private func touchDragExit() {
        self.onTouchOut(.touchDragExit)
    }
    @objc private func touchDown() {
        self.onTouchIn(.touchDown)
    }
    @objc private func touchCancel() {
        self.onTouchOut(.touchCancel)
    }
    @objc private func touchUpInside() {
        self.onTouchOut(.touchUpInside)
    }
    @objc private func touchUpOutside() {
        self.onTouchOut(.touchUpOutside)
    }
    private func onTouchIn(_ event: UIControlEvents) {
        let duration = event == .touchDown ? 0 : 0.15
        UIView.animate(withDuration: duration) {
            self.alpha = 0.2
        }
    }
    private func onTouchOut(_ event: UIControlEvents) {
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1.0
        }
    }
}

