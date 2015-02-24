## 1. Caching Files.

### SAVE IMAGE to Documents/Photos 
```objc
        UIImage *photoImage = _parkingPhotoImageView.image;
        
        //CACHE PATH
        NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];

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




