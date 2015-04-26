//
//  WebViewController.swift
//  simpleWebView
//
//  Created by Yuta Chiba on 2015/04/26.
//  Copyright (c) 2015年 yuinchirn. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    // StoryBoardで配置したwebViewのプロパティ
    @IBOutlet weak var webView: UIWebView!
    
    // 初期URL
    let initialUrl = NSURL(string: "https://www.google.co.jp")
    
    /* 最初の表示時に呼ばれるメソッド */
    override func viewDidLoad() {
        super.viewDidLoad()

        // webViewのデリゲートを設定
        webView.delegate = self
        
        // 初期URLで読み込み
        let request = NSURLRequest(URL: initialUrl!)
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
