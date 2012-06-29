//
//  Contato.m
//  02aContatos
//
//  Created by ios2749 on 27/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Contato.h"

@implementation Contato

@synthesize nome, telefone, email, endereco, site;

-(NSString *) emailTo {
    return [NSString stringWithFormat:@"%@ <%@>", self.nome, self.email];
}

-(NSString *) description
{
    return [self emailTo];
}

@end
