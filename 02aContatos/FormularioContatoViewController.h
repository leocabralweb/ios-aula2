//
//  FormularioContatoViewController.h
//  02aContatos
//
//  Created by ios2749 on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"

@interface FormularioContatoViewController : UIViewController

@property IBOutlet UITextField *nome;
@property IBOutlet UITextField *telefone;
@property IBOutlet UITextField *email;
@property IBOutlet UITextField *endereco;
@property IBOutlet UITextField *site;

@property (weak) NSMutableArray *contatos;

-(id) init;
-(void) cancela;
-(Contato *) pegaDadosDoFormulario;
-(void)criaContato;

@end
