39. Custom TextField
==

## Переводим все введенные данные в верхний регистр

```objc
//Upper case
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //Переводим все введенные данные в верхний регистр
    NSRange lowercaseCharRange = [string rangeOfCharacterFromSet:[NSCharacterSet lowercaseLetterCharacterSet]];
    if (lowercaseCharRange.location != NSNotFound) {
        textField.text = [textField.text stringByReplacingCharactersInRange:range
                                                                 withString:[string uppercaseString]];
        return NO;
    }
    return  YES;
}
```

## Фильтрация вводимых данных (для региона: 667).
```obc
//REGION
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([string length] < 1)    // non-visible characters are okay
        return YES;
    
    NSString * searchStr = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"%@",searchStr);
    
    if ([searchStr isValidNumeric] && searchStr.length <= 3) {
        return YES;
    } else {
        return NO;
    }
}

```

## Фильтрация вводимых данных (для автономера: A123AA или такси: AA123).
```objc

```







