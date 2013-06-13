//June 13, 2013
//Reza Fatahi

Last week, I had written about the usefuleness of the HPPLE library for parsing the internet (http://aug2uag.blogspot.com/2013/06/happle-and-accessing-paths-in-xpath.html). There's no doubt HPPLE is a great and powerful instrument for parsing XML, yet, circumstances prompted me to dig a little more deep, and investigate whether or not there were a way of parsing data without the need to define much of the path.

After having seen how NSString methods can effectively displace the need for regular expressions, I did a bit of searching and came across the NSScan class. This class takes a string as a parameter, splits the input to the point where the parameter is reached, and saves the remainder of the input to a new string, if allowed.

		http://stackoverflow.com/questions/6825834/objective-c-how-to-extract-part-of-a-string-e-g-start-with

Essentially, instead of traversing a path, the NSScan identifies a sequence of chars (as an NSString object), and splits the document at that site. This is the ideal method to parse CSS, something that was not possible with HPPLE, in addition to other sources including XML.
					

		NSString *inputString = @"</li>";	//this can be CSS or XML or other
		NSString *startTag = @"<li class=\"retail\">";
   		NSString *endTag = @"</li>";
                           
     	NSString *savedString = nil;
                           
        NSScanner *scanner = [[NSScanner alloc] initWithString:inputString];
        [scanner scanUpToString:startTag intoString:nil];
        scanner.scanLocation += [startTag length];
        [scanner scanUpToString:endTag intoString:&savedString];


This was then abstracted into a method, as below:

		+ (NSString *)scanString:(NSString *)string startTag:(NSString *)startTag endTag:(NSString *)endTag
		{
		    
		    NSString* scanString = @"";
		    
		    if (string.length > 0) {
		        
		        NSScanner* scanner = [[NSScanner alloc] initWithString:string];
		        
		        [scanner scanUpToString:startTag intoString:nil];
		        scanner.scanLocation += [startTag length];
		        [scanner scanUpToString:endTag intoString:&scanString];
		    }
		    
		    
		    return scanString;
		    
		}

Parsing can be carried out simply as a single or sequence of this method call to obtain the desired end string product. Thank you to Natasha Murashev for help to make this possible (http://natashatherobot.com/, https://twitter.com/NatashaTheRobot).