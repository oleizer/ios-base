Properties.
==

## Properties with Blocks

Поскольку внутри блока self ретейнится но не релизится, поэтому нужно использовать `кваллификатор (спецификатор)  __weak.`

```objc
SHGAPIManager * __weak weakSelf = self;
 
NSURLSession *session = [NSURLSession sharedSession];
NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              
                                            weakSelf.accessToken = accessToken;
                                        } ];
    [dataTask resume];
}
```






