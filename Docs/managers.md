APIManager
==

## NSURLSession

```objc
#pragma mark - Actions

//SIGN = md5(“app_id=” + app_id + “&email=&password=&random=” + random + “&salt=” + salt);
//NSURL *url = [NSURL URLWithString:@"http://test.shtrafy-gibdd.ru/api.php?method=authorize&app_id=ios_2.0&random=9768&sign=c5457e93861bda0992aae951edfad901"];

- (void)anonymAuthorization
{
//   http://test.shtrafy-gibdd.ru/api.php?method=authorize&app_id=ios_2.0&random=9768&sign=c5457e93861bda0992aae951edfad901
    
    NSString *app_id = @"ios_2.0";
    NSString *salt = @"zdDBAyBNMvOHPzzLFLGq";
    NSInteger random = [@9768 integerValue];
    
    NSString *stringForMD5 = [NSString stringWithFormat:@"app_id=%@&email=&password=&random=%ld&salt=%@", app_id, (long)random, salt];
    
    NSString *sign= [NSString md5String:stringForMD5];
    
    NSString *urlBase = @"http://test.shtrafy-gibdd.ru/";
    NSString *method =  @"api.php?";
    NSString *parameters = [NSString stringWithFormat:@"method=authorize&app_id=%@&random=%ld&sign=%@", app_id, random, sign];
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", urlBase, method, parameters];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"\n\nURL = %@\n\n", url);
    
    //Request
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                
                                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                NSLog(@"%@", json);
                                                
                                            } ];
    
    [dataTask resume];
}

//SIGN = md5(“app_id=” + app_id + “&email=” + email + “&password=” + password + “&random=” + random + “&salt=” + salt);
//URL = http://test.shtrafy-gibdd.ru/api.php?method=authorize&app_id=ios_2.0&email=art.igberdin@gmail.com&password=12345&random=987&sign=26100710a036a9a5dd97c96088d8f704

- (void)userAuthorization
{
    NSString *app_id = @"ios_2.0";
    NSString *salt = @"zdDBAyBNMvOHPzzLFLGq";
    NSInteger random = [@987 integerValue];
    NSString *email = @"art.igberdin@gmail.com";
    NSString *password = @"12345";
    
    NSString *stringForMD5 = [NSString stringWithFormat:@"app_id=%@&email=%@&password=%@&random=%ld&salt=%@", app_id, email, password, (long)random, salt];
    
    //NSString *sign = [self md5String:stringForMD5];
    NSString *sign = [NSString md5String:stringForMD5];
    
    NSString *urlBase = @"http://test.shtrafy-gibdd.ru/";
    NSString *method =  @"api.php?";
    NSString *parameters = [NSString stringWithFormat:@"method=authorize&app_id=%@&email=%@&password=%@&random=%ld&sign=%@", app_id, email, password, random, sign];
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@", urlBase, method, parameters];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSLog(@"\n\nURL = %@\n\n", url);
    
    //Request
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                
                                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                NSLog(@"%@", json);
                                                
                                            } ];
    [dataTask resume];
}
```






