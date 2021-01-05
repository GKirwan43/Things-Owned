import UIKit

class PreviewViewController: UIPageViewController, UIPageViewControllerDataSource, MainVCDelegate {
    
    //Jackson is gay
    
    var currentPage = 0;
    
    lazy var viewControllerList:[UIViewController] = {

        let sb = UIStoryboard(name: "Main", bundle: nil)

        let vc1 = sb.instantiateViewController(withIdentifier: "preview1") as! previewPage
        let vc2 = sb.instantiateViewController(withIdentifier: "preview2") as! previewPage
        let vc3 = sb.instantiateViewController(withIdentifier: "preview3") as! previewPage
        let vc4 = sb.instantiateViewController(withIdentifier: "preview4") as! previewPage
        vc1.delegate = self
        vc2.delegate = self
        vc3.delegate = self
        vc4.delegate = self
        return [vc1, vc2, vc3, vc4]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self

        let firstViewController = viewControllerList[0]
        self.setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)

    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.firstIndex(of: viewController) else { return nil }

        let previousIndex = vcIndex - 1
        
        currentPage = vcIndex
        
        guard previousIndex >= 0 else { return nil }

        guard viewControllerList.count > previousIndex else { return nil }
        

        return viewControllerList[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.firstIndex(of: viewController) else { return nil }

        let nextIndex = vcIndex + 1
        
        currentPage = vcIndex
        

        guard viewControllerList.count != nextIndex else { return nil }

        guard viewControllerList.count > nextIndex else { return nil }

        return viewControllerList[nextIndex]
    }
    
    func buttonPlusTapped() {
        currentPage+=1
        if viewControllerList.count > currentPage {
            let firstViewController = viewControllerList[currentPage]
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }

}
