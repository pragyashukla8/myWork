package utility;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
 * Class		: EmailValidator		
 * Description	: Allows the application components to perform email validation 
 *
 *
 *	.....................................................................
 *	....+-----------------------------------------------------------+....						
 *	....|            EmailValidator Class                           |....						
 *	....|             << concrete class >>                          |....	                    
 *	....+-----------------------------------------------------------+....						
 *	....| [-] EMAIL_REGEX      : string <<static>>                  |....						
 *	....| [-] pattern          : Pattern                            |....						
 *	....| [-] matcher          : Matcher                            |....						
 *	....+-----------------------------------------------------------+....						
 *	....| [+] boolean:  validateEmail(string)                       |....										
 *	....+-----------------------------------------------------------+....						
 *	.....................................................................																				
 * 																								
 * @author ISHAN KAMAT 			
 * Date			    : 28 November, 2017
 * Source File name	: EmailValidator.java       	
 * 
 *
*/
public class EmailValidator {
    // Regex pattern to valid email address
    private static final String EMAIL_REGEX=
       "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$";
    //static Pattern object, since pattern is fixed
    private static Pattern pattern;
    //non-static Matcher object because it's created from the input String
    private Matcher matcher;
     
    public EmailValidator(){
        //initialize the Pattern object
        pattern = Pattern.compile(EMAIL_REGEX, Pattern.CASE_INSENSITIVE);
    }
    /**
     * This method validates the input email address with EMAIL_REGEX pattern
     * @param email
     * @return boolean
     */
    public boolean validateEmail(String email){
        matcher = pattern.matcher(email);
        return matcher.matches();
    }
}
