//
//  NoteExtension.swift
//  Notes
//
//  Created by Álvaro Gómez Segovia on 30/09/23.
//

import Foundation
import UIKit

extension AddNoteViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.layer.borderWidth = 2.0
            textView.layer.borderColor = UIColor.red.cgColor
        } else{
            textView.layer.borderWidth = 0.0
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.layer.borderWidth = 0.0
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.layer.borderWidth = 2.0
            textView.layer.borderColor = UIColor.red.cgColor
        } else{
            textView.layer.borderWidth = 0.0
        }
    }
}

extension DetailNoteViewController : UITextViewDelegate{
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.layer.borderWidth = 2.0
            textView.layer.borderColor = UIColor.red.cgColor
        } else{
            textView.layer.borderWidth = 0.0
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.layer.borderWidth = 0.0
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.layer.borderWidth = 2.0
            textView.layer.borderColor = UIColor.red.cgColor
        } else{
            textView.layer.borderWidth = 0.0
        }
    }
}

