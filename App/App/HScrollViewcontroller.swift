//
//  HScrollViewcontroller.swift
//  App
//
//  Created by JackSon TMM on 1/7/2020.
//  Copyright © 2020 JackSon TMM. All rights reserved.
//

import SwiftUI

struct HScrollViewControl<Content: View>: UIViewControllerRepresentable {
    let pageWidth:CGFloat
    let contentSize:CGSize
    let content:Content
    @Binding var pagelocation:CGFloat//0 =l 1= right
    
    init(pageWidth:CGFloat,contentSize:CGSize,page:Binding<CGFloat>,@ViewBuilder content:()->Content){
        self.pageWidth = pageWidth
        self.contentSize = contentSize
        self.content = content()
        self._pagelocation = page
    }
  
    func makeCoordinator() -> coordinator {
        return coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let scrollview = UIScrollView()
        scrollview.bounces = false
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.isPagingEnabled = true
        scrollview.delegate = context.coordinator
        context.coordinator.Scrollview = scrollview
        //sub view of view in UIkit
        
        
        let viewcontrol = UIViewController()
        viewcontrol.view.addSubview(scrollview)
        //main view in UIkit
        
        //Swift View -> UIkit
        let host = UIHostingController(rootView: content)
        viewcontrol.addChild(host)
        scrollview.addSubview(host.view)
        host.didMove(toParent: viewcontrol)
        context.coordinator.Host = host
        return viewcontrol
    }
    
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        let scrollview:UIScrollView = context.coordinator.Scrollview
        scrollview.frame = CGRect(x: 0, y: 0, width: pageWidth, height: contentSize.height)
        scrollview.contentSize = contentSize
        scrollview.setContentOffset(CGPoint(x: pagelocation * (contentSize.width - pageWidth), y: 0), animated: true)
        context.coordinator.Host.view.frame = CGRect(origin: .zero, size: contentSize)
    }
    
    
    class coordinator:NSObject,UIScrollViewDelegate{
        let parent:HScrollViewControl
        var Scrollview:UIScrollView!
        var Host : UIHostingController<Content>!
        
        init(_ parent:HScrollViewControl){
            self.parent = parent
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            parent.pagelocation = scrollView.contentOffset.x < parent.pageWidth * 0.5 ? 0 : 1
        }
    }
}
