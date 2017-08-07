package bingo.sso.server.web.validate;

import javax.servlet.http.HttpServletRequest;

import bingo.sso.core.authentication.IBadAuthenticateCounter;
import bingo.sso.core.authentication.form.IRandomCodeValidator;

public class RandomCodeValidator implements IRandomCodeValidator{
	protected IBadAuthenticateCounter badAuthenticateCounter;
	protected int badAuthenticateCount = 5;
	
	public boolean validateCode(String randomCode, HttpServletRequest req) {
		return ValidateCodeUtil.validateCode(randomCode, req);
	}

	public boolean isNeedValidate(String credentialsType, String identity, HttpServletRequest req) {
		if(badAuthenticateCounter == null){
			return true;
		}
		
		return badAuthenticateCounter.getCount(credentialsType, identity) >= badAuthenticateCount;
	}

	public void setBadAuthenticateCounter(
			IBadAuthenticateCounter badAuthenticateCounter) {
		this.badAuthenticateCounter = badAuthenticateCounter;
	}

	public void setBadAuthenticateCount(int badAuthenticateCount) {
		this.badAuthenticateCount = badAuthenticateCount;
	}


}
