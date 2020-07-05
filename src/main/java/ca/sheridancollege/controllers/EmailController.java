package ca.sheridancollege.controllers;

import java.io.IOException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ca.sheridancollege.beans.UserAccount;
import ca.sheridancollege.database.DatabaseAccess;
import ca.sheridancollege.email.EmailServiceImpl;
import ca.sheridancollege.extras.Logger;

@Controller
public class EmailController {
	
	@Autowired @Lazy DatabaseAccess database;
	@Autowired EmailServiceImpl mailSender;
	Logger log = new Logger();
	
	@GetMapping("/processInterac")
	public String sendMail(@RequestParam String reciever, Authentication authentication)
			throws MessagingException, IOException {
		int userAccountId = database.findUserAccount(authentication.getName()).getUserAccountId();
		UserAccount userAccount = database.getUserAccountById(userAccountId);		
		String nameOfSender = userAccount.getFirstName() +" "+ userAccount.getLastName();
		
		mailSender.sendMail(nameOfSender, reciever, "Test");
		log.print(authentication.getName()+" SENT funds to "+ reciever);
		return "redirect:/account";
	}
	
}
