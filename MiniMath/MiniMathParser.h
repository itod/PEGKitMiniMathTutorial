#import <PEGKit/PKParser.h>

enum {
    MINIMATH_TOKEN_KIND_STAR = 14,
    MINIMATH_TOKEN_KIND_OPEN_PAREN,
    MINIMATH_TOKEN_KIND_PLUS,
    MINIMATH_TOKEN_KIND_CLOSE_PAREN,
};

@interface MiniMathParser : PKParser

@end

