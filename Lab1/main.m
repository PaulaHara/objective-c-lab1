//
//  main.m
//  Lab1
//
//  Created by paula on 2018-08-13.
//  Copyright © 2018 paula. All rights reserved.
//

#import <Foundation/Foundation.h>

int selectAnOption(void);
NSString *getUppercaseWord(NSString *word);
NSString *getLowercaseWord(NSString *word);
NSInteger getNumberizeWord(NSString *word);
NSString *getCanadianizeWord(NSString *word);
NSString *getRespondWord(NSString *word);
NSString *getSpaceWord(NSString *word);
int getCountChars(NSString *word);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char input[255];
        printf("Give a word: ");
        fgets(input, 255, stdin);
        
        NSString *word = [NSString stringWithUTF8String:input];
        
        int option = 1, count = 0;
        NSInteger number = -2;
        NSString *wordModify;
        
        while(option != 0) {
            option = selectAnOption();
            
            switch(option){
                case 1:
                    wordModify = getUppercaseWord(word);
                    break;
                case 2:
                    wordModify = getLowercaseWord(word);
                    break;
                case 3:
                    number = getNumberizeWord(word);
                    break;
                case 4:
                    wordModify = getCanadianizeWord(word);
                    break;
                case 5:
                    wordModify = getRespondWord(word);
                    break;
                case 6:
                    wordModify = getSpaceWord(word);
                    break;
                case 7:
                    count = getCountChars(word);
                case 0:
                    wordModify = @"Bye bye!";
                    break;
                default:
                    break;
            }
            
            if(option >= 0 && option <= 7){
                if(number == -2 && count == 0){
                    NSLog(@"%@", wordModify);
                }else if(number != -2){
                    if(number == -1){
                        NSLog(@"Not a valid number!\n");
                    }else{
                        NSLog(@"%d", (int) number);
                    }
                    number = -2;
                }if(count != 0){
                    NSLog(@"Your word has %d characters!\n", count);
                    count = 0;
                }
            }else{
                NSLog(@"Invalid option!\n");
            }
        }
    }
    return 0;
}

int selectAnOption(){
    int option;
    
    printf("Choose an option: \n1. Uppercase\n2. Lowercase\n3. Numberize\n4. Canadianize\n5. Respond\n6. De-Space-It\n7. Count\n0. Quit\n");
    scanf("%d", &option);
    
    return option;
}

NSString *getUppercaseWord(NSString *word){
    NSString *wordUpper;
    wordUpper = [word uppercaseString];
    return wordUpper;
}

NSString *getLowercaseWord(NSString *word){
    NSString *wordLower;
    wordLower = [word lowercaseString];
    return wordLower;
}

NSInteger getNumberizeWord(NSString *word){
    NSString *wordLower;
    wordLower = getLowercaseWord(word);
    if([wordLower isEqualToString:@"0"] || [wordLower isEqualToString:@"zero"]){
        return 0;
    }
    
    NSInteger number = [wordLower integerValue];
    if(number == 0){
        return -1;
    }
    
    return number;
}

NSString *getCanadianizeWord(NSString *word){
    NSMutableString *wordCanadianize = [[word stringByReplacingOccurrencesOfString:@"\n" withString:@""] mutableCopy];
    [wordCanadianize appendString:@", eh?"];
    return wordCanadianize;
}

NSString *getRespondWord(NSString *word){
    NSString *lastChar = [word substringFromIndex:[word length] - 1];
    if([lastChar isEqualToString:@"?"]){
        lastChar = @"I don't know";
    }else if([lastChar isEqualToString:@"!"]){
        lastChar = @"Whoa, calm down!";
    }
    return lastChar;
}

NSString *getSpaceWord(NSString *word){
    NSString *wordSpace;
    wordSpace = [word stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    return wordSpace;
}

int getCountChars(NSString *word){
    NSMutableString *wordCount = [[word stringByReplacingOccurrencesOfString:@"\n" withString:@""] mutableCopy];
    int count = (int) [wordCount length];
    return count;
}
