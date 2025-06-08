# **How-To: Authenticate clasp in Firebase Studio**

Document Owner: Sparky  
Security Review: Guardian  
Version: 1.0

## **1\. Objective**

This guide provides the specific steps required to authenticate the Google Apps Script Command Line Interface (clasp) within the Firebase Studio environment.

**Important Note:** The current method for authentication in Firebase Studio involves a workaround due to the environment's lack of a traditional localhost for the OAuth redirect. This process is functional but requires careful manual steps.

## **2\. Security Advisory (Guardian)**

* **Credential Handling:** This process will result in an authorization token. Be aware that this token grants clasp permission to manage your Apps Script projects.  
* **URL Safety:** You will be copying and pasting URLs from your browser and terminal. Ensure you are only using URLs provided directly by the Google Authorization screen and clasp. Do not use URLs from untrusted sources.

## **3\. Step-by-Step Authentication Procedure**

Follow these steps precisely in the Firebase Studio terminal and your local web browser.

1. **Initiate Login:** In a new Firebase Studio terminal, run the standard clasp login command:  
   clasp login

2. **Handle the First Error:** A new window or tab will open in your browser with an authorization error. This is expected. The important part is the URL in the address bar. **Copy this entire URL.**  
3. **Open the URL in a New Tab:** Open a new, clean browser tab and paste the URL you just copied into the address bar. Press Enter.  
4. **Follow the Google Auth Flow:** Proceed through the standard Google account selection and permission grant screens.  
5. **Handle the Second Error (and copy the URL):** After granting permissions, you will be redirected to another page that shows an error (likely a "This site can’t be reached" or similar localhost error). This is also expected. **Copy the full URL from this error page's address bar.**  
6. **Use curl to Finalize Authentication:** Go back to your Firebase Studio terminal. You will now use curl to send the URL you just copied. This completes the authentication flow by manually passing the token back to your local clasp instance.  
   \# IMPORTANT: Paste the URL you copied in Step 5 inside the double quotes  
   curl "PASTE\_THE\_URL\_FROM\_THE\_SECOND\_ERROR\_PAGE\_HERE"

7. **Verification:** Upon success, curl will likely output a success message, and clasp will save your credentials to a .clasprc.json file in your home directory within the environment. You are now authenticated. You can verify this by running a command like:  
   clasp projects

   This should list your Google Apps Script projects without asking you to log in again.