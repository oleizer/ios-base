4. Models.
==

### Properties: strong, copy, assign.

### Description method.

```objc
- (NSString *)description
{
    return [NSString stringWithFormat:@"MenuText: %@, MenuIcon: %@", _menuText, _menuIcon];
}
```

### Развернутый description method

```objc
- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p, %@>",
            [self class],
            self,
            @{@"date":_m_date,
              @"date_paid":_m_datePaid,
              @"protocol":_m_datePaid,
              
              @"fine_id":@(_m_fineId),
              @"has_receipt":@(_m_hasReceipt),
              @"obtained_by":@(_m_obtainedBy),
              @"reqs_id":@(_m_reqsId),
              @"status":@(_m_status),
              @"sum":@(_m_sum),
              }
            ];
}
```

### Использовать стратегию в моделях. Проектирование моделей.

### Протокол копирования.

### Стратегия при проектировании моделек.
Проектирование моделек.

SHGServerObject

```objc
- (id)initWithServerResponse:(NSDictionary *)responseObject
{
    self = [super init];
    if (self) {

    }
    return self;
}
```

SHCAccessToken:SHGServerObject

```objc
//В реализации:
- (id)initWithServerResponse:(NSDictionary *)responseObject
{
    self = [super initWithResponse:responseObject];
    if (self) {
    NSString *token = [response objectForKey:@"access_token"];
    NSString *expires = [response objectForKey:@"expires"];

    self.accessToken = token;
    self.expires = expires
    }
    return self;
}
```

### Mantle.





