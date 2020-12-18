//
//  PageControl.swift
//  GraphApp
//
//  Created by Angel Hernández on 12/11/20.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numberOfPages
        pageControl.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        
        return pageControl
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var pageControl: PageControl
        
        init(_ pageControl: PageControl) {
            self.pageControl = pageControl
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            pageControl.currentPage = sender.currentPage
        }
    }
}
