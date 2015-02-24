## 1. Caching Files.

### Cache image
```objc
//Save image to Documents
//IMAGE
UIImage *photoImage = _parkingPhotoImageView.image;

//CACHE PATH
NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
NSString *uniquePhotoName = [[[NSUUID alloc] init] UUIDString];

//NAME
uniquePhotoName = [uniquePhotoName stringByAppendingPathExtension:@"png"];
NSString * urlPath = [cachePath stringByAppendingPathComponent:uniquePhotoName];

//WRITE TO FILE
NSData* data = UIImagePNGRepresentation(photoImage);
BOOL writeSuccess = [data writeToFile:urlPath atomically:YES];
    
if (writeSuccess) {
    UIImage *imageFromFile = [UIImage imageWithContentsOfFile:urlPath];
}
        //////////////////////////////////////
```

### Get Image from Cache
```objc
    if (parkingCapture.imageUrlPath) {
        NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSString *uniquePhotoName = parkingCapture.imageUrlPath;
        NSString * urlPath = [cachePath stringByAppendingPathComponent:uniquePhotoName];
        
        UIImage* image = [UIImage imageWithContentsOfFile:urlPath];
        cell.parkingPhoto.image = image;
    }
```

