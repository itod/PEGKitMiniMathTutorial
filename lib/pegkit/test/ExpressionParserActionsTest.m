//
//  ExpressionParserActionsTest.m
//  PEGKit
//
//  Created by Todd Ditchendorf on 3/27/13.
//
//

#import "TDTestScaffold.h"
#import "PGParserFactory.h"
#import "PGParserGenVisitor.h"
#import "PGRootNode.h"
#import "ExpressionActionsParser.h"

@interface ExpressionParserActionsTest : XCTestCase
@property (nonatomic, retain) PGParserFactory *factory;
@property (nonatomic, retain) PGRootNode *root;
@property (nonatomic, retain) PGParserGenVisitor *visitor;
@property (nonatomic, retain) ExpressionActionsParser *parser;
@end

@implementation ExpressionParserActionsTest

- (void)setUp {
    self.factory = [PGParserFactory factory];
    _factory.collectTokenKinds = YES;

    NSError *err = nil;
    NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"expressionActions" ofType:@"grammar"];
    NSString *g = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&err];
    
    err = nil;
    self.root = (id)[_factory ASTFromGrammar:g error:&err];
    _root.grammarName = @"ExpressionActions";
    
    self.visitor = [[[PGParserGenVisitor alloc] init] autorelease];
    [_root visit:_visitor];
    
    self.parser = [[[ExpressionActionsParser alloc] initWithDelegate:self] autorelease];

#if TD_EMIT
    path = [[NSString stringWithFormat:@"%s/test/ExpressionActionsParser.h", getenv("PWD")] stringByExpandingTildeInPath];
    err = nil;
    if (![_visitor.interfaceOutputString writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&err]) {
        NSLog(@"%@", err);
    }

    path = [[NSString stringWithFormat:@"%s/test/ExpressionActionsParser.m", getenv("PWD")] stringByExpandingTildeInPath];
    err = nil;
    if (![_visitor.implementationOutputString writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&err]) {
        NSLog(@"%@", err);
    }
#endif
}


- (void)tearDown {
    self.factory = nil;
}


- (void)testYes {
    NSError *err = nil;
    PKAssembly *res = [_parser parseString:@"yes" error:&err];
    NSLog(@"%@", err);
    TDEqualObjects(@"[1]yes^", [res description]);
}

- (void)testYES {
    NSError *err = nil;
    PKAssembly *res = [_parser parseString:@"YES" error:&err];
    NSLog(@"%@", err);
    TDNotNil(err);
    TDNil(res);
}

- (void)testNo {
    PKAssembly *res = [_parser parseString:@"no" error:nil];
    TDEqualObjects(@"[0]no^", [res description]);
}

- (void)testNO {
    NSError *err = nil;
    PKAssembly *res = [_parser parseString:@"NO" error:&err];
    NSLog(@"%@", err);
    TDNotNil(err);
    TDNil(res);
}

- (void)testYesOrNo {
    PKAssembly *res = [_parser parseString:@"yes or no" error:nil];
    TDEqualObjects(@"[1]yes/or/no^", [res description]);
}

- (void)testNoOrYes {
    PKAssembly *res = [_parser parseString:@"no or yes" error:nil];
    TDEqualObjects(@"[1]no/or/yes^", [res description]);
}

- (void)testYesAndNo {
    PKAssembly *res = [_parser parseString:@"yes and no" error:nil];
    TDEqualObjects(@"[0]yes/and/no^", [res description]);
}

- (void)testNoAndNo {
    PKAssembly *res = [_parser parseString:@"no and no" error:nil];
    TDEqualObjects(@"[0]no/and/no^", [res description]);
}

- (void)testYesAndYes {
    PKAssembly *res = [_parser parseString:@"yes and yes" error:nil];
    TDEqualObjects(@"[1]yes/and/yes^", [res description]);
}

- (void)test42 {
    PKAssembly *res = [_parser parseString:@"42" error:nil];
    TDEqualObjects(@"[42]42^", [res description]);
}

- (void)test42GE43 {
    PKAssembly *res = [_parser parseString:@"42 >= 43" error:nil];
    TDEqualObjects(@"[0]42/>=/43^", [res description]);
}

- (void)test42LE43 {
    PKAssembly *res = [_parser parseString:@"42 <= 43" error:nil];
    TDEqualObjects(@"[1]42/<=/43^", [res description]);
}

- (void)test42LT43 {
    PKAssembly *res = [_parser parseString:@"42 < 43" error:nil];
    TDEqualObjects(@"[1]42/</43^", [res description]);
}


- (void)parser:(PKParser *)p didMatchArgList:(PKAssembly *)a {
    //NSLog(@"%s %@", __PRETTY_FUNCTION__, a);
    
}

@end
