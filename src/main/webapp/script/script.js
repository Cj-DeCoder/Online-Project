/**
 * 
 */
function validatePhone() {
       let phoneInput = document.getElementById("phone").value;
       let phonePattern = /^\+91[6-9]\d{9}$/;

       if (phonePattern.test(phoneInput)) {
           alert("Valid phone number: " + phoneInput);
       } else {
           alert("Invalid phone number. Please enter in the format: +91XXXXXXXXXX");
       }
   }