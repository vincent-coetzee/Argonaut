//
//  ViewController.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Cocoa

internal enum Kind
    {
    case request
    case response
    }
    
class PrimaryViewController: NSViewController
    {
    ///
    ///
    /// Constants are declared in the class that uses them since they need
    /// to be close to the point of use otherwise toouch time is wasted
    /// looking them from a centralized constant class. In keeping with
    /// AppKit tradition constants are all prefixed with "k" for ease
    /// of recognition.
    ///
    ///
    private static let kRequestSegmentIndex = 0
    private static let kResponseSegmentIndex = 1
    
    @IBOutlet var outliner: NSOutlineView!
    @IBOutlet var generateButton: NSButton!
    @IBOutlet var requestResponseSelectionControl: NSSegmentedControl!
    
    override func viewDidLoad()
        {
        super.viewDidLoad()
        self.initViews()
        }
        
    private func initViews()
        {
        }
        
    @IBAction func onRequestResponseClicked(_ sender: Any?)
        {
        let selectedIndex = self.requestResponseSelectionControl.selectedSegment
        if selectedIndex == Self.kRequestSegmentIndex
            {
            self.switchViewToRequests()
            }
        else
            {
            self.switchViewToResponses()
            }
        }
        
    @IBAction func onGenerateNewRequestClicked(_ sender: Any?)
        {
        }
        
    private func switchViewToRequests()
        {
        }
        
    private func switchViewToResponses()
        {
        }
    }

extension PrimaryViewController: NSOutlineViewDataSource
    {
//    @objc public func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int
//        {
//        if item == nil
//            {
//            return(1)
//            }
//        else
//            {
//            let item = item as! FileItem
//            return(item.childCount)
//            }
//        }
//        
//    @objc public func outlineView(_ outlineView: NSOutlineView, heightOfRowByItem item: Any) -> CGFloat
//        {
//        return(18)
//        }
//        
//    @objc public func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any
//        {
//        if item.isNil
//            {
//            return(self.currentItem)
//            }
//        else if let event = item as? FileItem
//            {
//            return(event.child(atIndex: index))
//            }
//        fatalError()
//        }
//
//    @objc public func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool
//        {
//        if let event = item as? FileItem
//            {
//            return(event.isExpandable)
//            }
//        return(false)
//        }
//        
//    @objc public func outlineView(_ outlineView: NSOutlineView, rowViewForItem item: Any) -> NSTableRowView?
//        {
//        return(nil)
//        }
//        
//    @objc public func outlineView(_ outlineView: NSOutlineView, shouldSelectItem item: Any) -> Bool
//        {
////        guard outliner.isNotNil else
////            {
////            return(false)
////            }
////        let selectedRow = outliner!.selectedRow
////        if selectedRow >= 0,let cell = outliner?.view(atColumn: 0, row: selectedRow, makeIfNecessary: false) as? HierarchyCellView
////            {
////            cell.revert()
////            }
//        return(true)
//        }
//
//    public func outlineViewSelectionDidChange(_ notification: Notification)
//        {
//        let row = self.outliner.selectedRow
//        if row != -1
//            {
//            if let item = self.outliner.item(atRow: row) as? FileItem,item.isIssue,let line = item.lineNumber
//                {
//                self.scrollToLineNumber(line)
//                }
//            }
//        }
//        
//        
//    public func outlineView(_ outlineView: NSOutlineView,viewFor tableColumn: NSTableColumn?,item: Any) -> NSView?
//        {
//        if let event = item as? FileItem
//            {
//            let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "FileItemCellView"), owner: nil) as! FileItemCellView
//            event.configure(cell: view)
//            return(view)
//            }
//        return(nil)
//        }
    }

extension PrimaryViewController: NSOutlineViewDelegate
    {
    }
