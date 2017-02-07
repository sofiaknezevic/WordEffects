//
//  main.m
//  WordEffects
//
//  Created by Sofia Knezevic on 2017-02-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import <Foundation/Foundation.h>

void options(){
    printf ("Enter a number to do one of these things: \n");
    printf ("1. Uppercase \n");
    printf ("2. Lowercase \n");
    printf ("3. Numberize \n");
    printf ("4. Canadianize \n");
    printf ("5. I'll respond to your questions & || exclamations \n");
    printf ("6. No-More-Spaces \n");
    printf ("7. Word Count (separated by spaces)\n");
    printf ("8. Remove all your wacky punctuation!?.,;:\n");
    printf ("0 -- to exit!\n");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        //255 unit long array of characters
        char inputChars[255];
        
        NSString *question = @"?";
        NSString *exclamation = @"!";
        NSString *noSpaces;
        
        
        printf("Input a string: ");
        //limit input to max 255 characters
        fgets(inputChars, 255, stdin);
        
        //print as a c string
        printf("Your string is %s\n", inputChars);
        
        //convert char array to an NSString object
        NSString *inputString = [NSString stringWithUTF8String:inputChars];
        
        //print NSString object
        NSLog(@"Input was: %@", inputString);
        
        //get the length of the string
        NSUInteger numberize = [inputString length];
        
        int value;
        do{
        
        options();
        
        scanf("%i", &value);
        switch (value) {
            case 0:{
                break;
            }
            case 1:{
                //uppercase
                NSString *uppercase = [inputString uppercaseString];
                NSLog(@"soft input: %@", uppercase);
                
                break;
            }
            
            case 2:{
                //lowercase
                NSString *lowercase = [inputString lowercaseString];
                NSLog(@"soft input: %@", lowercase);
                
                break;
            }
            
            case 3:{
                //numberize
                NSLog(@"numberized string: %lu", (unsigned long)numberize);
                
                break;
            }
            
            case 4:{
                //append the string ", eh?"
                NSString *canadianized = [inputString stringByAppendingString:@", eh?"];
                NSLog(@"canadianized: %@", canadianized);
                
                break;
            }
            
            case 5:{
                //respond to questions & exclamations
                
                //retrieve the last character in the string
                NSString *last = [inputString substringFromIndex:(numberize-2)];
                
                if([last containsString:(question)]){
                    
                    NSLog(@"I don't know");
                    
                } else if([last containsString:(exclamation)]){
                    
                    NSLog(@"Whoa, calm down!");
                    
                }
                
                break;
                
            }
            
            case 6:{
                //de-space the string
                if([inputString containsString:@" "]){
                    
                    noSpaces = [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"];
                    
                }
                
                NSLog(@"Nospaces: %@", noSpaces);
                
                break;
            }
                
            case 7:{
                //word count
                int count;
                
                for(int i = 0; i<[inputString length]; i++){
                    
                    if([inputString characterAtIndex:i] == ' '){
                        
                        count++;
                        
                    }
                }
                
                NSLog(@"You typed %i words", (count+1));
                
            }
                break;
                
            case 8:{
                //I need to go to bed, I'll finish this tomorrowW!!!!!!! :) 
                break;
            }
                
            
            default:
            break;
        }
        
        }while (value!=0);
        
        
        
    }
    return 0;
}
