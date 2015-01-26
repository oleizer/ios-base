
## 22. Memory Warning code.

Theres a menu command that will invoke it.
`Hardware > Simulate Memory Warning` from the simulator.

On iOS6.

The controller doesn't automaticly release the view when receive a memory warning. So the viewDidUnload never be called. But we still need to release our view (including sub view) when a memry warning happens. Like this.

```objc
- (void)didReceiveMemoryWarning
{
    if ([self isViewLoaded] && [self.view window] == nil) {
        self.view = nil;
        self.subView = nil;
        self.subViewFromNib = nil;
    }
    self.someDataCanBeRecreatedEasily = nil;
    
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc. that aren't in use.
}
```
http://stablekernel.com/blog/view-controller-lifecycle-in-ios6/

Simple realizaiton:
```objc
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if([self isViewLoaded] && ![[self view] window]) {
        [self setView:nil];
    }
}
```
