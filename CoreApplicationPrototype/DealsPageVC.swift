//
//  DealsPageVC.swift
//  CoreApplicationPrototype
//
//  Created by Brett Chafin on 1/19/17.
//  Copyright © 2017 InboundRXCapstone. All rights reserved.
//

import UIKit

class DealsPageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self      //Conforms to this dataSource protocol
        self.delegate = self        //Conforms to this delegate protocol
        
        //Sets the first page's ViewController
        if let firstVC = VCArray.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
    //Array that will hold our views
    lazy var VCArray: [UIViewController] = {
        return [self.VCInstance(name: "FirstVC"),
                self.VCInstance(name: "SecondVC"),
                self.VCInstance(name: "ThirdVC"),
                self.VCInstance(name: "FourthVC")
               ]
    }()
    
    
    //instatiates a particular view controller for the PageVC array
    private func VCInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
    }
    
    
    
    
    /***************** Protocol Implementations *************/
    
    //returns the previous UIViewController in the array
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        //Get the current index. If we cant, return nil
        guard let viewControllerIndex = VCArray.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        //Make sure previousIndex is a valid array index
        guard previousIndex >= 0 else {
            return VCArray.last
        }
        
        //Make sure previousIndex is a valid array index
        guard VCArray.count > previousIndex else {
            return nil
        }
        
        //return the previous UIViewController in the array
        return VCArray[previousIndex]
        
    }
    
    
    
    //returns the preceeding UIViewController in the array
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        //Get the current index. If we cant, return nil
        guard let viewControllerIndex = VCArray.index(of: viewController) else {
            return nil
        }
        
        let proceedingIndex = viewControllerIndex + 1
        
        //Make sure proceedingIndex is a valid array index
        guard proceedingIndex < VCArray.count else {
            return VCArray.first
        }
        
        //Make sure proceedingIndex is a valid array index
        guard VCArray.count > proceedingIndex else {
            return nil
        }
        
        //return the proceeding UIViewController in the array
        return VCArray[proceedingIndex]
    }
    
    
    
    
    // The number of items reflected in the page indicator.
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCArray.count
    }
    
    
    
    // The selected item reflected in the page indicator.
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
       guard let firstViewController = viewControllers?.first,
        let firstViewControllerIndex = VCArray.index(of: firstViewController) else {
            return 0
        }
        
        return firstViewControllerIndex
    }
}
