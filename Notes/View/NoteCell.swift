//
//  NoteCell.swift
//  Notes
//
//  Created by Álvaro Gómez Segovia on 23/09/23.
//

import UIKit

class NoteCell: UITableViewCell {

    // Titulo
    @IBOutlet weak var noteContent: UILabel!
    // Fecha
    @IBOutlet weak var noteDate: UILabel!
    // Contenido
    @IBOutlet weak var noteTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
