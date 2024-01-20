import WebKit

extension WKWebView {
    var refreshControl: UIRefreshControl? {
        (scrollView.getAllSubviews() as [UIRefreshControl]).first
    }

    func setPullToRefresh() {
        (scrollView.getAllSubviews() as [UIRefreshControl]).forEach {
            $0.removeFromSuperview()
        }

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(webViewPullToRefreshHandler(source:)), for: .valueChanged)
        scrollView.addSubview(refreshControl)
    }

    @objc func webViewPullToRefreshHandler(source: UIRefreshControl) {
        self.reload()
    }
}

extension UIView {
    class func getAllSubviews<T: UIView>(from parentView: UIView) -> [T] {
        return parentView.subviews.flatMap { subView -> [T] in
            var result = getAllSubviews(from: subView) as [T]
            if let view = subView as? T {
                result.append(view)
            }
            return result
        }
    }

    func getAllSubviews<T: UIView>() -> [T] {
        return UIView.getAllSubviews(from: self) as [T]
    }
}
