//
// Created by azu on 2013/10/14.
//


#import "UniqueArray.h"


@implementation UniqueArray {

}
+ (NSArray *)patternOne:(NSArray *) array {
    return [[NSOrderedSet orderedSetWithArray:array] array];
}

+ (NSArray *)patternTwo:(NSArray *) array {
    NSMutableArray *unique = [NSMutableArray array];
    for (id obj in array) {
        if (![unique containsObject:obj]) {
            [unique addObject:obj];
        }
    }
    return unique;
}

@end