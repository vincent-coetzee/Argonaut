//
//  JSONViewController.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Cocoa

internal class JSONViewController: NSViewController
    {
    private static let kKeyFieldIdentifier = NSUserInterfaceItemIdentifier(rawValue: "KeyField")
    private static let kTypeFieldIdentifier = NSUserInterfaceItemIdentifier(rawValue: "TypeField")
    private static let kValueFieldIdentifier = NSUserInterfaceItemIdentifier(rawValue: "ValueField")
    private static let kKeyCellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "KeyCell")
    private static let kTypeCellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "TypeCell")
    private static let kValueCellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "ValueCell")
    
    internal var json: NSDictionary?
        {
        didSet
            {
            if let dictionary = self.json
                {
                var converter = JSONTreeConverter(dictionary: dictionary)
                let elements = converter.convertToElementTree()
                self.update(with: elements)
                }
                
            }
        }
        
    @IBOutlet var outliner: NSOutlineView!
    @IBOutlet var typeColumn: NSTableColumn!
    
    private var items = JSONElementItems()
    
    override func viewDidLoad()
        {
        super.viewDidLoad()
        self.outliner.dataSource = self
        self.outliner.delegate = self
        self.typeColumn.sizeToFit()
        }
    
    private func update(with elements: JSONElementItems)
        {
        self.items = elements
        self.outliner.reloadData()
        }
    }

extension JSONViewController: NSOutlineViewDataSource
    {
    @objc public func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int
        {
        if item == nil
            {
            return(self.items.count)
            }
        else
            {
            if let item = item as? JSONElementItem
                {
                return(item.childCount)
                }
            return(0)
            }
        }
        
    @objc public func outlineView(_ outlineView: NSOutlineView, heightOfRowByItem item: Any) -> CGFloat
        {
        return(24)
        }
        
    @objc public func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any
        {
        if item.isNil && index < self.items.count
            {
            return(self.items[index])
            }
        else if let element = item as? JSONElementItem
            {
            return(element.child(atIndex: index))
            }
        fatalError()
        }

    @objc public func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool
        {
        if let element = item as? JSONElementItem
            {
            return(element.isExpandable)
            }
        return(false)
        }
        
//    @objc public func outlineView(_ outlineView: NSOutlineView, rowViewForItem item: Any) -> NSTableRowView?
//        {
//        return(nil)
//        }
        
    @objc public func outlineView(_ outlineView: NSOutlineView, shouldSelectItem item: Any) -> Bool
        {
//        guard outliner.isNotNil else
//            {
//            return(false)
//            }
//        let selectedRow = outliner!.selectedRow
//        if selectedRow >= 0,let cell = outliner?.view(atColumn: 0, row: selectedRow, makeIfNecessary: false) as? HierarchyCellView
//            {
//            cell.revert()
//            }
        return(true)
        }
    }

extension JSONViewController: NSOutlineViewDelegate
    {
    public func outlineViewSelectionDidChange(_ notification: Notification)
        {
        }
        
    public func outlineView(_ outlineView: NSOutlineView,viewFor tableColumn: NSTableColumn?,item: Any) -> NSView?
        {
        if let element = item as? JSONElementItem,let column = tableColumn
            {
            if column.identifier == Self.kKeyFieldIdentifier
                {
                let view = outlineView.makeView(withIdentifier: Self.kKeyCellIdentifier, owner: nil) as! NSTableCellView
                view.textField?.stringValue = element.name
                return(view)
                }
            else if column.identifier == Self.kTypeFieldIdentifier
                {
                let view = outlineView.makeView(withIdentifier: Self.kTypeCellIdentifier, owner: nil) as! NSTableCellView
                view.imageView?.image = element.typeIcon
                view.imageView?.contentTintColor = NSColor.controlAccentColor
                return(view)
                }
            else if column.identifier == Self.kValueFieldIdentifier
                {
                let view = outlineView.makeView(withIdentifier: Self.kValueCellIdentifier, owner: nil) as! NSTableCellView
                view.textField?.stringValue = element.value
                return(view)
                }
            }
        return(nil)
        }
    }
