//
//  ListaContatosViewController.h
//  02aContatos
//
//  Created by ios2749 on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaContatosViewController : UITableViewController

@property (weak) NSMutableArray *contatos;

- (void) exibeFormulario;

@end
