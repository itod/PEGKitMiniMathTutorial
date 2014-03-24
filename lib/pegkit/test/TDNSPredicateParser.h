#import <PEGKit/PKParser.h>

enum {
    TDNSPREDICATE_TOKEN_KIND_ALL = 14,
    TDNSPREDICATE_TOKEN_KIND_FALSEPREDICATE,
    TDNSPREDICATE_TOKEN_KIND_NOT_UPPER,
    TDNSPREDICATE_TOKEN_KIND_OPEN_CURLY,
    TDNSPREDICATE_TOKEN_KIND_HASH_ROCKET,
    TDNSPREDICATE_TOKEN_KIND_GE,
    TDNSPREDICATE_TOKEN_KIND_DOUBLE_AMPERSAND,
    TDNSPREDICATE_TOKEN_KIND_TRUEPREDICATE,
    TDNSPREDICATE_TOKEN_KIND_AND_UPPER,
    TDNSPREDICATE_TOKEN_KIND_CLOSE_CURLY,
    TDNSPREDICATE_TOKEN_KIND_TRUE,
    TDNSPREDICATE_TOKEN_KIND_NE,
    TDNSPREDICATE_TOKEN_KIND_OR_UPPER,
    TDNSPREDICATE_TOKEN_KIND_BANG,
    TDNSPREDICATE_TOKEN_KIND_SOME,
    TDNSPREDICATE_TOKEN_KIND_INKEYWORD,
    TDNSPREDICATE_TOKEN_KIND_BEGINSWITH,
    TDNSPREDICATE_TOKEN_KIND_LT,
    TDNSPREDICATE_TOKEN_KIND_EQUALS,
    TDNSPREDICATE_TOKEN_KIND_CONTAINS,
    TDNSPREDICATE_TOKEN_KIND_GT,
    TDNSPREDICATE_TOKEN_KIND_OPEN_PAREN,
    TDNSPREDICATE_TOKEN_KIND_CLOSE_PAREN,
    TDNSPREDICATE_TOKEN_KIND_DOUBLE_PIPE,
    TDNSPREDICATE_TOKEN_KIND_MATCHES,
    TDNSPREDICATE_TOKEN_KIND_COMMA,
    TDNSPREDICATE_TOKEN_KIND_LIKE,
    TDNSPREDICATE_TOKEN_KIND_ANY,
    TDNSPREDICATE_TOKEN_KIND_ENDSWITH,
    TDNSPREDICATE_TOKEN_KIND_FALSE,
    TDNSPREDICATE_TOKEN_KIND_LE,
    TDNSPREDICATE_TOKEN_KIND_BETWEEN,
    TDNSPREDICATE_TOKEN_KIND_EL,
    TDNSPREDICATE_TOKEN_KIND_NOT_EQUAL,
    TDNSPREDICATE_TOKEN_KIND_NONE,
    TDNSPREDICATE_TOKEN_KIND_DOUBLE_EQUALS,
};

@interface TDNSPredicateParser : PKParser

@end

