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
@synthesize contatos, contatos_ordenados;

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
                                        initWithTitle:@"Salvar" 
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
    
    Contato *contato = [[Contato alloc] init];
    contato.nome = nome.text;
    contato.telefone = telefone.text;
    contato.email = email.text;
    contato.endereco = endereco.text;
    contato.site = site.text;
    
    NSLog(@"Novo Contato: %@", contato);
    
    return contato;
}

-(void) criaContato
{
    // Utilizar apenas "contatos" iria acessar diretamente a variavel, sem passar pelo getter
    [self gravaContatoOrdenado:[self pegaDadosDoFormulario]];
    [self.contatos addObject:[self pegaDadosDoFormulario]];
    [self dismissModalViewControllerAnimated:YES];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) gravaContatoOrdenado:(Contato *)novo_contato
{
    NSString *letra = [novo_contato.nome substringWithRange:NSMakeRange(0, 1)];
    NSMutableArray *itens = [self.contatos_ordenados objectForKey:letra];
    
    if(!itens)
        itens = [[NSMutableArray alloc] init];
    
    [itens addObject:novo_contato];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
