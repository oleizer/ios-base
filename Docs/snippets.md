17. Snippets
==

##Simulate home clicked

```objc
exit(0);
```

### GET-request-nsurlconnection

```objc
NSURL *URL = [NSURL URLWithString:@"http://example.com"];
 NSURLRequest *request = [NSURLRequest requestWithURL:URL];

 [NSURLConnection sendAsynchronousRequest:request
                                    queue:[NSOperationQueue mainQueue]
                        completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
     // ...
 }];
```

### GET-request-nsurlsession

```objc
NSURL *URL = [NSURL URLWithString:@"http://example.com"];
 NSURLRequest *request = [NSURLRequest requestWithURL:URL];

 NSURLSession *session = [NSURLSession sharedSession];
 NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                         completionHandler:
     ^(NSData *data, NSURLResponse *response, NSError *error) {
         // ...
     }];

 [task resume];
```
