//
//  AppDelegate.swift
//  Reddit-macOS
//
//  Created by Carson Katri on 7/31/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSToolbarDelegate, NSTextFieldDelegate {

    var window: NSWindow!

    var toolbar: NSToolbar!
    
    @ObservedObject var state = ContentViewState()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.title = "Reddit"

        window.contentView = NSHostingView(rootView: ContentView().environmentObject(state))
        
        toolbar = NSToolbar(identifier: "reddit.toolbar")
        toolbar.allowsUserCustomization = true
        toolbar.delegate = self
        self.window.toolbar = toolbar

        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    /// Subreddit search and sorting method
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        
        let toolbarItem = NSToolbarItemGroup(itemIdentifier: itemIdentifier)

        let field = NSTextField(string: state.subreddit)
        field.placeholderString = "Jump to Subreddit"
        field.heightAnchor.constraint(equalToConstant: 22).isActive = true
        field.delegate = self
        let fieldItem = NSToolbarItem(itemIdentifier: NSToolbarItem.Identifier(rawValue: "subreddit.search.bar"))
        fieldItem.view = field
        
        let text = NSTextField(string: "r/")
        text.isBezeled = false
        text.backgroundColor = NSColor(hue: 1, saturation: 1, brightness: 1, alpha: 0)
        text.isEditable = false
        let labelItem = NSToolbarItem(itemIdentifier: NSToolbarItem.Identifier(rawValue: "r.label"))
        labelItem.view = text
        
        let segmentedControl = NSSegmentedControl(labels: SortBy.allCases.map { $0.rawValue.capitalized }, trackingMode: .selectOne, target: self, action: #selector(sortBy(_:)))
        segmentedControl.selectedSegment = 0
        let segmentedItem = NSToolbarItem()
        segmentedItem.view = segmentedControl
        
        toolbarItem.subitems = [labelItem, fieldItem, segmentedItem]

        return toolbarItem
    }
    
    @objc func sortBy(_ sender: NSSegmentedControl) {
        state.sortBy = SortBy.allCases[sender.selectedSegment]
    }
    
    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
        if commandSelector == #selector(NSResponder.insertNewline(_:)) {
            state.subreddit = textView.string.replacingOccurrences(of: "r/", with: "").replacingOccurrences(of: " ", with: "")
            return true
        }
        return false
    }
    
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [NSToolbarItem.Identifier(rawValue: "subreddit.search")]
    }

    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return self.toolbarDefaultItemIdentifiers(toolbar)
    }

    func toolbarSelectableItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return self.toolbarDefaultItemIdentifiers(toolbar)
    }
}

