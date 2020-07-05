package ca.sheridancollege.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import ca.sheridancollege.beans.User;
import ca.sheridancollege.beans.UserAccount;
import ca.sheridancollege.database.DatabaseAccess;
import ca.sheridancollege.extras.Generator;

@Controller
public class RootController {

	@Autowired @Lazy DatabaseAccess database;
	Generator generate = new Generator();
	
	@GetMapping("/")
	public String bootUp() {
		return "home.html";
	}
	
	@GetMapping("/generate")
	public String generate() {
		for (int i=0; i<10; i++) {
			generate.userAccount();
			generate.employee();
		}
		generate.administrator();
		return "home.html";
	}
	
	@GetMapping("/login")
	public String openLogin() {
		return "login.html";
	}
	
	@GetMapping("/signup")
	public String openSignup(Model web) {
		web.addAttribute("userAccount", new UserAccount());
		return "signup.html";
	}	
	
	@GetMapping("/access-denied")
	public String openAccessDenied() {
		return "access-denied.html";
	}
	
	@GetMapping("/addAdmin/{username}/{password}")
	public String add(@PathVariable String username, @PathVariable String password) {
		database.addUser(new User(username, password, 0,0,0));
		database.addUserRoles(database.findUserAccount(username).getUserId(), 1);
		return "redirect:/";
	}
	
}
