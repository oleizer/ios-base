## 1. Caching Files.

`UIImage (Caching)`
http://www.wmdeveloper.com/2010/09/save-and-load-uiimage-in-documents.html

### Cache image
```objc
//Save image to Documents
//IMAGE
UIImage *photoImage = _parkingPhotoImageView.image;

//CACHE PATH
NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];

//UNIQUE NAME
NSString *uniquePhotoName = [[[NSUUID alloc] init] UUIDString];
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
        //CACHE PATH
        NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSString *uniquePhotoName = parkingCapture.imageUrlPath;
        NSString * urlPath = [cachePath stringByAppendingPathComponent:uniquePhotoName];
       
        //Файл есть в кэше.
        BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:urlPath];
        if (fileExists) {
        UIImage* image = [UIImage imageWithContentsOfFile:urlPath];
        cell.parkingPhoto.image = image;
        }
    }
```

