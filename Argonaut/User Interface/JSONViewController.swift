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
    
    internal var group: Group?
        {
        didSet
            {
            if let group = self.group
                {
                var converter = JSONTreeConverter(group: group)
                let elements = converter.convertToElementTree()
                self.update(with: elements)
                }
                
            }
        }
        
    @IBOutlet var outliner: NSOutlineView!
    @IBOutlet var typeColumn: NSTableColumn!
    
    private var items = JSONElementItems()
    private var columnWidths: Array<CGFloat> = []
    
    override func viewDidLoad()
        {
        super.viewDidLoad()
        self.outliner.dataSource = self
        self.outliner.delegate = self
        self.typeColumn.width = 38
        self.columnWidths = Array<CGFloat>(repeating: 0, count: self.outliner.tableColumns.count)
        self.outliner.autoresizesOutlineColumn = true
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
        
//    @objc public func outlineView(_ outlineView: NSOutlineView, heightOfRowByItem item: Any) -> CGFloat
//        {
//        guard let element = item as? JSONElementItem else
//            {
//            return(0)
//            }
//        guard let column = outlineView.tableColumn(withIdentifier: Self.kValueFieldIdentifier) else
//            {
//            return(0)
//            }
//        let row = outlineView.row(forItem: item)
//        let width = column.width
//        let startSize = NSSize(width: width,height: 0)
//        let attributedString = NSAttributedString(string: element.value,attributes: [.font: self.font])
//        let rect = attributedString.boundingRect(with: startSize, options: [.usesFontLeading,.usesLineFragmentOrigin])
//        if rect.size.height > self.font.pointSize + 4.0
//            {
//            self.largeRowHeights.insert(row)
//            }
//        print("STRING: \(element.value) RECT: \(rect)")
//        return(rect.size.height)
//        }
        
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
    }

extension JSONViewController: NSOutlineViewDelegate
    {
//    public func outlineViewItemDidExpand(_ notification: Notification)
//        {
//        if let item = notification.userInfo?["NSObject"] as? JSONElementItem
//            {
//            let row = self.outliner.row(forItem: item)
//            guard row != -1 else
//                {
//                return
//                }
//            for index in 0..<self.outliner.tableColumns.count
//                {
//                if let cell = self.outliner.view(atColumn: index, row: row, makeIfNecessary: false) as? NSTableCellView,let textField = cell.textField
//                    {
//                    let width = textField.attributedStringValue.size().width
//                    if width > self.columnWidths[index]
//                        {
//                        self.columnWidths[index] = width
//                        self.outliner.tableColumns[index].width = width
//                        }
//                    }
//                }
//            }
//        }
        
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
                view.imageView?.image?.isTemplate = true
                view.imageView?.contentTintColor = NSColor.controlAccentColor
                return(view)
                }
            else if column.identifier == Self.kValueFieldIdentifier
                {
                let view = outlineView.makeView(withIdentifier: Self.kValueCellIdentifier, owner: nil) as! NSTableCellView
                view.textField?.stringValue = element.value
                view.textField?.lineBreakMode = .byWordWrapping
                view.textField?.maximumNumberOfLines = 0
                return(view)
                }
            }
        return(nil)
        }
    }
