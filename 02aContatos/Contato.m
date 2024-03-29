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

-(NSString *) emailTo 
{
    return [NSString stringWithFormat:@"%@ <%@>", self.nome, self.email];
}

-(NSString *) description
{
    return [self emailTo];
}

-(void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.nome      forKey:@"nome"];
    [aCoder encodeObject:self.telefone  forKey:@"telefone"];
    [aCoder encodeObject:self.email     forKey:@"email"];
    [aCoder encodeObject:self.endereco  forKey:@"endereco"];
    [aCoder encodeObject:self.site      forKey:@"site"];
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if(self)
    {
        self.nome       = [aDecoder decodeObjectForKey:@"nome"];
        self.telefone   = [aDecoder decodeObjectForKey:@"telefone"];
        self.email      = [aDecoder decodeObjectForKey:@"email"];
        self.endereco   = [aDecoder decodeObjectForKey:@"endereco"];
        self.site       = [aDecoder decodeObjectForKey:@"site"];
    }
    
    return self;
}

@end
