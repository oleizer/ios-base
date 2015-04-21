UITableViewCell. Incapsulated code.
==

### Configure Cell.

```objective-c
//cellForRowAtIndexPath:
cell = [LeftMenuCell configureCell:cell withContext:context];

//inside cell
+ (instancetype)configureCell:(LeftMenuCell *)cell withContext:(SHGMenuContext *)context
{
    //Text
    cell.menuLabel.text = context.menuText;
    //Icon
    NSString *imageName = [NSString stringWithFormat:@"%@", context.menuIcon];
    UIImage *image = [UIImage imageNamed:imageName];
    cell.menuImageView.image = image;
    
    return cell;
}
```

### Change selected color.

```objective-c
//inside cell
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    //Yellow color
    UIView *selectedBackgroundView = [UIView new];
    [selectedBackgroundView setBackgroundColor:[UIColor darkTableViewColor]];
    [self setSelectedBackgroundView:selectedBackgroundView];
}
```

###





