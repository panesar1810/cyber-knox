package ca.sheridancollege.extras;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;

import com.github.javafaker.Faker;

import ca.sheridancollege.beans.CreditCard;
import ca.sheridancollege.beans.DebitCard;
import ca.sheridancollege.beans.Employee;
import ca.sheridancollege.beans.User;
import ca.sheridancollege.beans.UserAccount;
import ca.sheridancollege.database.DatabaseAccess;

public class Generator {
	
	@Autowired @Lazy DatabaseAccess database;
	Faker fake = new Faker();	
	SimpleDateFormat SDFdate = new SimpleDateFormat("dd/MM/yyyy");
	
	public Long getAccountNumber() {
        return fake.number().numberBetween(1000000000L, 9999999999L);
    }
	
	public Long getSinNumber() {
        return fake.number().numberBetween(100000000L, 999999999L);
    }
	
	public DebitCard getDebit() {
		return new DebitCard(
				String.valueOf(getCardNumber()),
				String.valueOf(getCVV()),
				String.valueOf(getExpiryDate()),
				String.valueOf(10000));
	}
	
	public CreditCard getCredit() {
		return new CreditCard(
				String.valueOf(getCardNumber()),
				String.valueOf(getCVV()),
				String.valueOf(getExpiryDate()),
				String.valueOf(10000));
	}
	
    public Long getCardNumber() {
        return fake.number().numberBetween(1000000000000000L, 9999999999999999L);
    }

    public int getCVV() {
    	return fake.number().numberBetween(100, 999);
    }
    
    @SuppressWarnings("deprecation")
	public String getExpiryDate() {
    	Date from = new Date();
    	from.setDate(1);
    	from.setMonth(1);
    	from.setYear(2025);

    	Date to = new Date();
    	to.setDate(30);
    	to.setMonth(12);
    	to.setYear(2030);
    	
    	return String.valueOf(fake.date().between(from, to));
    }
    
    public String getTransactionDate() {
    	return SDFdate.format(new Date());
    }
    
//  USER ACCOUNT --------------------------------------------------------
    
    @SuppressWarnings("deprecation")
	public void userAccount() {    	
    	Date from = new Date();
    	from.setDate(1);
    	from.setMonth(1);
    	from.setYear(1950);
    	Date to = new Date();
    	to.setDate(30);
    	to.setMonth(12);
    	to.setYear(2010);
    	
    	String gender = "";
    	int num = fake.random().nextInt(0, 2);
    	if (num == 0) gender = "male";
    	if (num == 1) gender = "female";
    	
    	DebitCard debit = getDebit();
    	CreditCard credit = getCredit();
    	
    	database.addDebit(debit);
    	database.addCredit(credit);
    
		int debitCardId = database.getDebitByNumber(debit.getNumber()).getDebitCardId();
		int creditCardId = database.getCreditByNumber(credit.getNumber()).getCreditCardId();

		String fname = fake.name().fullName();
		String lname = fake.name().lastName();
		
    	database.addUserAccount(new UserAccount(fname, lname,
    			String.valueOf(fake.date().between(from, to)),
    			fake.address().fullAddress(), gender,
    			String.valueOf(fake.phoneNumber().cellPhone()),
    			fake.internet().emailAddress(),
    			String.valueOf(fake.number().numberBetween(11, 61)),
    			String.valueOf(getSinNumber()),
    			String.valueOf(getAccountNumber()),
    			debitCardId, creditCardId));
    	
    	int userAccountId = database.getUserAccountByDC(debitCardId,creditCardId).getUserAccountId();
    	
    	database.addUser(new User(fname+lname, "root", userAccountId, 0, 0));
    	database.addUserRoles(database.findUserAccount(fname+lname).getUserId(), 3);
    }
    
    public void employee() {
    	String firstName = fake.name().firstName();
    	String lastName = fake.name().lastName();
    	
    	database.addEmployee(new Employee(firstName, lastName, SDFdate.format(new Date())));

    	int employeeId = database.findUserAccount(firstName+lastName).getEmployeeId();
    	
		database.addUser(new User(firstName+lastName, "root", employeeId, 0, 0));
		database.addUserRoles(database.findUserAccount(firstName+lastName).getUserId(), 2);
    }
    
    public void administrator() {
		database.addUser(new User("jon", "root", 0, 0, 0));
		database.addUserRoles(database.findUserAccount("jon").getUserId(), 1);
    }
    
}
