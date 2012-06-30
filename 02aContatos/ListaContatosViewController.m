//
//  ListaContatosViewController.m
//  02aContatos
//
//  Created by ios2749 on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListaContatosViewController.h"
#import "FormularioContatoViewController.h"

@interface ListaContatosViewController ()

@end

@implementation ListaContatosViewController

@synthesize contatos;

- (id) init
{
    if (self = [super init]) {
        
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] 
                                      initWithBarButtonSystemItem: UIBarButtonSystemItemAdd 
                                      target: self
                                      action: @selector(exibeFormulario)];
        
        self.navigationItem.title = @"Contatos";
        self.navigationItem.rightBarButtonItem = rightButton;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
    }
    
    return self;
}

- (void) exibeFormulario
{
    /*
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Exibir Formulário" 
                                                    message:@"Isso é um formulário"
                                                   delegate:nil 
                                          cancelButtonTitle:@"Ok" 
                                          otherButtonTitles:nil, nil];
    [alert show];
    */
    
    FormularioContatoViewController *form = [[FormularioContatoViewController alloc] init];
    
    form.contatos = self.contatos;
    
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:form];
    
    navigation.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self.navigationController presentModalViewController:navigation animated:YES];
    //[self presentModalViewController:navigation animated:YES];
}

-(void) viewWillAppear:(BOOL)animated
{
    NSLog(@"Contatos cadastrados: %d", [self.contatos count]);
    [self.tableView reloadData];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contatos count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identificador = @"QualquerString";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identificador];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] 
                                 initWithStyle:UITableViewCellStyleDefault 
                                 reuseIdentifier:Identificador];        
    }
    
    
    Contato *contato = [self.contatos objectAtIndex:indexPath.row];
    
    cell.textLabel.text = contato.nome;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.contatos removeObjectAtIndex:indexPath.row];
        NSArray *itens = [NSArray arrayWithObject:indexPath];
        
        [self.tableView deleteRowsAtIndexPaths:itens 
                              withRowAnimation:UITableViewRowAnimationFade];
        
        // Com o reloadData o efeito fica quebrado. 
        // Sem ele, a quantidade de itens declarados na tableView fica inconsistente
        [self.tableView reloadData]; 
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Contato *contato = [self.contatos objectAtIndex:indexPath.row];
    FormularioContatoViewController *form = [[FormularioContatoViewController alloc] initWithContato:contato];
    
    form.contatos = contatos;
    
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:form];
    
    navigation.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self.navigationController presentModalViewController:navigation animated:YES];
    
    // Present
    
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

/* =============================== */
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

@end
