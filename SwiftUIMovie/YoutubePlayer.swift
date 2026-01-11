//
//  YoutubePlayer.swift
//  SwiftUIMovie
//
//  Created by Saurabh Jaiswal on 27/12/25.
//

import SwiftUI
import WebKit

struct YoutubePlayer: UIViewRepresentable {
    let videoId: String
    
    func makeUIView(context: Context) -> WKWebView {
        // 1. Configure for inline playback (prevents forced fullscreen)
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        
        // 2. Create WebView
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.scrollView.isScrollEnabled = false // Lock scrolling
        webView.backgroundColor = .black       // clean background
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
            guard !videoId.isEmpty else { return }
            
            // 1. Create a safe "Origin" URL
            // We use google.com as the 'trust' anchor to bypass strict domain checks
            let originURL = URL(string: "https://www.google.com")!
            
            // 2. Add the 'origin' parameter to the embed URL
            // This parameter is required by YouTube to authorize mobile players
            let embedUrlString = "https://www.youtube.com/embed/\(videoId)?playsinline=1&origin=https://www.google.com"
            
            let embedHTML = """
            <!DOCTYPE html>
            <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <style>
                    body { margin: 0; background-color: black; display: flex; justify-content: center; align-items: center; height: 100vh; }
                    iframe { width: 100%; height: 100%; border: none; }
                </style>
            </head>
            <body>
                <iframe 
                    width="100%" 
                    height="100%" 
                    src="\(embedUrlString)" 
                    frameborder="0" 
                    allowfullscreen>
                </iframe>
            </body>
            </html>
            """
            
            // 3. Load with the matching Base URL
            uiView.loadHTMLString(embedHTML, baseURL: originURL)
        }
}
