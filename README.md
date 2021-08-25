# HW #2a Let's scroll some content

Table views on iOS are used for a single column of vertically scrolling content, divided into rows and sections. The goal of this exercise is to get you up and running on how to create and populate a `UITableView`.

## Getting Started
* Create a `UITableViewController` subclass called `PIPokedexTableViewController`

## Displaying data
In `PIPokedexTableViewController`, you'll see some already implemented `UITableViewDataSource` methods:
```
- (NSInteger)numberOfSectionsInTableView:(UITbleView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}
```
Your job is to let the `UITableViewDataSource` know how many sections and rows in section your table view should display. 
Let's start with a single section and a hardcoded number of rows.

Although your table view has section and rows now, if you try to display your `PIPokedexTableViewController`, you'll noticed you will hit an exception:
`UITableView dataSource returned a nil cell for row at index path`

We also need to let the `UITableView` know which cell it needs to display. We do it in two steps:
* Register a cell to a `UITableView` 
* Implementing the `UITableViewDataSource`  `- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath`  method.

### Register a cell
Registering a cell to your `UITableView` can be done in two different ways, depending on the cell you want to display.

* If the cell was layouted using the Interface Builder, your should register it using the `UITableView` method:
    `- (void)registerNib:(nullable UINib *)nib forCellReuseIdentifier:(NSString *)identifier;`
    
* If the cell was layouted in its own implementation file, you should register it using the `UITableView` method:
    `- (void)registerClass:(nullable Class)cellClass forCellReuseIdentifier:(NSString *)identifier;`

For now, let's register a `UITableViewCell`, the end result should be something like this:
    `[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"kCellId"];`

### Return a cell
You do it by implementing the `- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath` method from  `UITableViewDataSource`.

You should never manually initialize your cell. You should always use  `-dequeueReusableCellWithIdentifier:forIndexPath:` to guarantee that a cell instance is returned for all registered identifiers. Instances returned from this dequeue method will also be properly sized when they are returned.

```
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"kCellId" forIndexPath:indexPath];
    cell.textLabel.text = @"My label text";
    return cell;
}
```
