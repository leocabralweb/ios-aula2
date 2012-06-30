//
//  FormularioContatoViewController.m
//  02aContatos
//
//  Created by ios2749 on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FormularioContatoViewController.h"
#import "Contato.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

@synthesize nome, telefone, email, endereco, site;
@synthesize contatos, contato;

-(id)init 
{
    self = [super init];
    
    if(self) {
        
        UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] 
                                       initWithTitle:@"Cancelar"
                                       style: UIBarButtonItemStylePlain 
                                       target: self 
                                       action: @selector(cancela)];
        
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] 
                                        initWithTitle:@"Criar" 
                                        style:UIBarButtonItemStylePlain 
                                        target:self 
                                        action:@selector(criaContato)];
        
        self.navigationItem.title = @"Novo Contato";
        
        self.navigationItem.leftBarButtonItem = leftButton;
        self.navigationItem.rightBarButtonItem = rightButton;
        
        self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    }
    
    return self;
}

-(void) cancela
{
    [self dismissModalViewControllerAnimated:YES];
}

-(Contato *) pegaDadosDoFormulario
{
    /*
     NSDictionary *contato = [NSDictionary dictionaryWithObjectsAndKeys:
     [nome text],       @"nome",
     [telefone text],   @"telefone",
     [email text],      @"email",
     [endereco text],   @"endereco",
     [site text],       @"site", 
     nil];
     
     NSMutableDictionary *contato = [[NSMutableDictionary alloc] init];
     [contato setObject:[nome text]      forKey:@"nome"];
     [contato setObject:[telefone text]  forKey:@"telefone"];
     [contato setObject:[email text]     forKey:@"email"];
     [contato setObject:[endereco text]  forKey:@"endereco"];
     [contato setObject:[site text]      forKey:@"site"];
     
     Contato *contato = [[Contato alloc] init];
     [contato setNome:[nome text]];
     [contato setTelefone:[telefone text]];
     [contato setEmail:[email text]];
     [contato setEndereco:[endereco text]];
     [contato setSite:[site text]];
     */
    
    if(!self.contato)
        self.contato = [[Contato alloc] init];
    
    self.contato.nome = nome.text;
    self.contato.telefone = telefone.text;
    self.contato.email = email.text;
    self.contato.endereco = endereco.text;
    self.contato.site = site.text;
    
    NSLog(@"Novo Contato: %@", self.contato);
    
    return self.contato;
}

-(void) alteraContato
{
    self.contato = [self pegaDadosDoFormulario];
    [self dismissModalViewControllerAnimated:YES];
}

-(void) criaContato
{
    // Utilizar apenas "contatos" iria acessar diretamente a variavel, sem passar pelo getter
    [self.contatos addObject:[self pegaDadosDoFormulario]];
    [self dismissModalViewControllerAnimated:YES];
}

-(id)initWithContato:(Contato *)_contato
{
    self = [self init];
    
    if(self)
    {
        self.contato = _contato;
        
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] 
                                        initWithTitle:@"Editar" 
                                        style:UIBarButtonItemStylePlain 
                                        target:self 
                                        action:@selector(alteraContato)];
        
        self.navigationItem.rightBarButtonItem = rightButton;
        self.navigationItem.title = @"Editando contato";
    }
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    if(self.contato)
    {
        self.nome.text      = self.contato.nome;
        self.telefone.text  = self.contato.telefone;
        self.email.text     = self.contato.email;
        self.endereco.text  = self.contato.endereco;
        self.site.text      = self.contato.site;
    }
}

/* Default ======================================================== */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidUnload
{
    self.contato = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
