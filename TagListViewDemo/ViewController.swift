//
//  ViewController.swift
//  TagListViewDemo
//
//  Created by Dongyuan Liu on 2015-05-09.
//  Copyright (c) 2015 Ela. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TagListViewDelegate {

    @IBOutlet weak var tagListView: TagListView!
    @IBOutlet weak var biggerTagListView: TagListView!
    @IBOutlet weak var biggestTagListView: TagListView!
    @IBOutlet weak var leftImageTagListView: TagListView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tagListView.delegate = self
        tagListView.addTag("TagListView")
        tagListView.addTag("TEAChart")
        tagListView.addTag("To Be Removed")
        tagListView.addTag("To Be Removed")
        tagListView.addTag("Quark Shell")
        tagListView.removeTag("To Be Removed")
        tagListView.addTag("On tap will be removed").onTap = { [weak self] tagView in
            self?.tagListView.removeTagView(tagView)
        }
        
        let tagView = tagListView.addTag("gray")
        tagView.tagBackgroundColor = UIColor.gray
        tagView.onTap = { tagView in
            print("Don’t tap me!")
        }

        tagListView.insertTag("This should be the third tag", at: 2)

        biggerTagListView.delegate = self
        biggerTagListView.textFont = UIFont.systemFont(ofSize: 15)
        biggerTagListView.shadowRadius = 2
        biggerTagListView.shadowOpacity = 0.4
        biggerTagListView.shadowColor = UIColor.black
        biggerTagListView.shadowOffset = CGSize(width: 1, height: 1)
        biggerTagListView.addTag("Inboard")
        biggerTagListView.addTag("Pomotodo")
        biggerTagListView.addTag("Halo Word")
        biggerTagListView.alignment = .center
        
        biggestTagListView.delegate = self
        biggestTagListView.textFont = UIFont.systemFont(ofSize: 24)
        // it is also possible to add all tags in one go
        biggestTagListView.addTags(["all", "your", "tag", "are", "belong", "to", "us"])
        biggestTagListView.alignment = .right

        leftImageTagListView.leftImage = UIImage(named: "ic_left")
        leftImageTagListView.selectedLeftImage = UIImage(named: "ic_selected_left")
        leftImageTagListView.wrapBeforeIndexes = [1, 2, 3]
        leftImageTagListView.delegate = self
        leftImageTagListView.addTag("skill1").isSelected = true
        leftImageTagListView.addTag("skill2")
        leftImageTagListView.addTag("skill3")
        leftImageTagListView.addTag("skill4")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: TagListViewDelegate
    func tagPressed(_ title: String, index:Int, tagView: TagView, sender: TagListView) {
        print("Tag pressed: \(title), \(index), \(sender)")
        tagView.isSelected = !tagView.isSelected
    }
    
    func tagRemoveButtonPressed(_ title: String, index:Int, tagView: TagView, sender: TagListView) {
        print("Tag Remove pressed: \(title), \(index), \(sender)")
        sender.removeTagView(tagView)
    }
}

