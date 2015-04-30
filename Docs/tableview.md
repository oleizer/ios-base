4. TableView. Static Cells. Dynamic Cells.
==

##TableViewDataSource

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTableView];
}

- (void)setupTableView {
    self.tableView.allowsSelection = NO;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        SHGFineCarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SHGFineCarCell"];
        
        //Configure Cell
        
        //Buttons
        [cell.carNumerButton addTarget:self
                                     action:@selector(carNumberButtonWasPressed:)
                           forControlEvents:UIControlEventTouchDown];
        [cell.carRegionButton addTarget:self
                                   action:@selector(regionButtonWasPressed:)
                         forControlEvents:UIControlEventTouchDown];
        [cell.carRegionButton addTarget:self
                                         action:@selector(registrationButtonWasPressed:)
                               forControlEvents:UIControlEventTouchDown];
        [cell.carRegistrationPromptButton addTarget:self
                                          action:@selector(registrationPromptButtonWasPressed:)
                                forControlEvents:UIControlEventTouchDown];
        
        return cell;
    }
    if (indexPath.row == 1) {
        SHGFineDriverCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SHGFineDriverCell"];
    
        [cell.driverLicenseButton addTarget:self
                                     action:@selector(driverLicenseButtonWasPressed:) forControlEvents:UIControlEventTouchDown];
        [cell.driverLicensePromptButton addTarget:self
                                           action:@selector(driverLicensePromptButton:)
                                 forControlEvents:UIControlEventTouchDown];
        
        return cell;
    }
    
    SHGButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SHGButtonCell"];
    
    [cell.checkFinesButton addTarget:self
                              action:@selector(checkFinesButton:)
                    forControlEvents:UIControlEventTouchDown];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 190;
    }
    if (indexPath.row == 1) {
        return 127;
    }
    return 83;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}






