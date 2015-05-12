//
//  WebViewController.swift
//  simpleWebView
//
//  Created by Yuta Chiba on 2015/04/26.
//  Copyright (c) 2015年 yuinchirn. All rights reserved.
//

import UIKit
import Social

class WebViewController: UIViewController, UIWebViewDelegate {

    // StoryBoardで配置したwebViewのプロパティ
    @IBOutlet weak var webView: UIWebView!
    
    // 初期URL
    let initialUrl = NSURL(string: "https://www.google.co.jp")
    
    /* 最初の表示時に呼ばれるメソッド */
    override func viewDidLoad() {
        super.viewDidLoad()

        // webViewのデリゲートを設定
         self.webView.delegate = self
        
        // 初期URLで読み込み
        let request = NSURLRequest(URL: initialUrl!)
        self.webView.loadRequest(request)
    }
    
    /* 戻るボタン押下時に呼ばれるメソッド */
    @IBAction func prevBtn(sender: AnyObject) {
        
        if self.webView.canGoBack {
            self.webView.goBack() // 戻る
        }
    }
    
    /* 進むボタン押下時に呼ばれるメソッド */
    @IBAction func nextBtn(sender: AnyObject) {
        
        if self.webView.canGoForward {
            self.webView.goForward() // 進む
        }
    }
    
    /* facebookボタン押下時に呼ばれるメソッド */
    @IBAction func facebookBtn(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            showPostView(serviceType: SLServiceTypeFacebook)
        }
    }

    /* twitterボタン押下時に呼ばれるメソッド */
    @IBAction func twitterBtn(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            showPostView(serviceType: SLServiceTypeTwitter)
        }
    }
    
    /* 投稿画面を表示 */
    func showPostView(#serviceType:String){
        
        var controller = SLComposeViewController(forServiceType: serviceType)
        
        // 表示中のページURLをセット
        let link: NSURL? = self.webView?.request?.URL
        if let shareUrl = link {
            controller.addURL(shareUrl)
        }
        
        // 表示中のページURLのタイトルをセット
        let title: String? = self.webView.stringByEvaluatingJavaScriptFromString("document.title")
        if let shareTitle = title {
            controller.setInitialText(shareTitle)
        }
        
        // 表示
        presentViewController(controller, animated: true, completion: {})
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
