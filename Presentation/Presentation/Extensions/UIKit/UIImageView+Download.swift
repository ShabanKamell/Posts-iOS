//Copyright HitchHiker© 2017. All rights reserved.

import SDWebImage

extension UIImageView {

    func setImage(
            url: String?,
            placeholder: UIImage? = nil,
            progressBlock: ((Int, Int, URL?) -> Void)? = nil
    ) {
        guard url != nil else {
            image = placeholder
            return
        }
        setImage(url: URL(string: url!), placeholder: placeholder)
    }

    func setImage(
            url: URL?,
            placeholder: UIImage? = nil,
            progressBlock: ((Int, Int, URL?) -> Void)? = nil
    ) {
        let options: SDWebImageOptions = [
            .scaleDownLargeImages,
            .continueInBackground,
            .lowPriority,
            .allowInvalidSSLCertificates
        ]
        sd_setImage(with: url, placeholderImage: placeholder, options: options, progress: progressBlock, completed: nil)
    }
}
