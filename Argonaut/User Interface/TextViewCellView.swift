//
//  TextViewCellView.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Cocoa

internal class TextViewCellView: NSTableCellView
    {
    internal var string: String = ""
        {
        didSet
            {
            self.textView.string = self.string
//            self.layoutTextView()
            self.layoutSubtreeIfNeeded()
            }
        }
        
    internal var contentSize: NSSize
        {
        let font = self.textView.font
        let string = self.string
        let attributedString = NSAttributedString(string: string,attributes: [.font: font])
        let width = self.textView.bounds.width
        let startSize = NSSize(width: width,height: 0)
        let rect = attributedString.boundingRect(with: startSize, options: [])
        return(rect.size)
        }
        
    internal let textView: NSTextView = NSTextView(frame: .zero)
    
    override init(frame: NSRect)
        {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.textView)
        self.textView.drawsBackground = false
        self.textView.isEditable = false
        self.textView.isSelectable = false
        self.layoutTextView()
        }
    
    required init?(coder: NSCoder)
        {
        fatalError("Should never be called.")
        }
        
    private func layoutTextView()
        {
        self.leadingAnchor.constraint(equalTo: self.textView.leadingAnchor,constant: 4).isActive = true
        self.trailingAnchor.constraint(equalTo: self.textView.trailingAnchor,constant: 4).isActive = true
        self.topAnchor.constraint(equalTo: self.textView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: self.textView.bottomAnchor,constant: 4).isActive = true
        }
        
    internal override func prepareForReuse()
        {
        self.string = ""
        }
    }
