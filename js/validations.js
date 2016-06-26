function formValidation()
{

    registerform = document.registerform;
	
	
    var username = registerform.username;
    var password = registerform.password;
    var name = registerform.name;
    var phoneno = registerform.phoneno;
    var email = registerform.email;
    var address = registerform.address;

    if (username_validation(username))
    {
        if (alphanumeric(username))
        {
            if (password_validation(password))
            {
                if (phoneno_Validation(phoneno))
                {
                    if (ValidateEmail(email))
                    {
                        if (address_validation(address))
                        {
                            return true;
                        }
                    }
                }
            }
        }
    }

    return false;

}

function loginformValidation()
{

    registerform = document.registerform;
	
	
    var username = loginform.username;
    var password = loginform.password;
    

    if (username_validation(username))
    {
        if (alphanumeric(username))
        {
            if (password_validation(password))
            {
               return true;
            }
        }
    }

    return false;

}


function username_validation(username)
{
    var username_len = username.value.length;
    if (username_len == 0 || username_len >= 15 || username_len < 6)
    {
        alert("Username should not be empty / length be between 6 and 15");
        username.focus();
        return false;
    }
    return true;
}


function alphanumeric(username)
{
    var letters = /^[0-9a-zA-Z]+$/;
    if (username.value.match(letters))
    {
        return true;
    }
    else
    {
        alert('Username must have alphanumeric characters only');
        username.focus();
        return false;
    }
}


function password_validation(password)
{
    var password_len = password.value.length;
    if (password_len == 0 || password_len >= 15 || password_len < 8)
    {
        alert("Password should not be empty / length be between 8 and 15");
        password.focus();
        return false;
    }
    return true;
}




function phoneno_Validation(phoneno)
{
    var numbers = /^[0-9]{10}$/;
    if (phoneno.value.match(numbers))
    {
        return true;
    }
    else
    {
        alert('Please enter your 10 digit mobile number');
        phoneno.focus();
        return false;
    }
}


function ValidateEmail(email)
{
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if (email.value.match(mailformat))
    {
        return true;
    }
    else
    {
        alert("You have entered an invalid email address!");
		email.focus();
        return false;
    }
}


function address_validation(address)
{
    var address_len = address.value.length;
    if (address_len < 1)
    {
        alert("Address cannot be blank");
        address.focus();
        return false;
    }
    return true;
}