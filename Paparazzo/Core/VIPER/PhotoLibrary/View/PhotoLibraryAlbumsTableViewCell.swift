import UIKit

final class PhotoLibraryAlbumsTableViewCell: UITableViewCell {
    
    // MARK: - Specs
    private let insets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    private let imageSize = CGSize(width: 44, height: 44)
    private let imageToTitleSpacing: CGFloat = 16
    
    // MARK: - Subviews
    private let label = UILabel()
    private let coverImageView = UIImageView()
    
    // MARK: - Init
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        coverImageView.backgroundColor = .black
        coverImageView.layer.cornerRadius = 6
        
        contentView.addSubview(coverImageView)
        contentView.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PhotoLibraryAlbumsTableViewCell
    func setCellData(_ cellData: PhotoLibraryAlbumCellData) {
        label.text = cellData.title
        coverImageView.setImage(fromSource: cellData.coverImage)
    }
    
    func setLabelFont(_ font: UIFont) {
        label.font = font
    }
    
    // MARK: - UITableViewCell
    override func layoutSubviews() {
        super.layoutSubviews()
        
        coverImageView.frame = CGRect(
            x: insets.left,
            y: (bounds.height - imageSize.height) / 2,
            width: imageSize.width,
            height: imageSize.height
        )
        
        let labelLeft = coverImageView.right + imageToTitleSpacing
        let labelMaxWidth = (bounds.right - insets.right) - labelLeft
        
        label.resizeToFitWidth(labelMaxWidth)
        label.left = labelLeft
        label.centerY = bounds.centerY
    }
}
